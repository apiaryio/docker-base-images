import os, re, sys, subprocess

from argparse import ArgumentParser
from glob import glob

class DockerImage:
    def __init__(self, dockerfile, versioned=False):
        self.dockerfile = dockerfile
        self.dockerfile_folder = os.path.dirname(self.dockerfile)
        self.versioned = versioned
        self._set_name()
        self._set_parent_name()
        self._extra_build()

    def _set_parent_name(self):
        df = open(self.dockerfile).read()
        m = re.search('FROM\s+([a-z0-9\/\-\:\.]+)', df)
        self.parent_name = (m.group(1)).strip()

    def _set_name(self):
        df_location = os.path.dirname(self.dockerfile)
        self.name = os.path.split(df_location)[1]
        self.full_name = "apiaryio/" + self.name

        if self.versioned:
            self.tag = self.name
            self.name = os.path.split(os.path.dirname(df_location))[1]
            self.full_name = "apiaryio/{0}:{1}".format(self.name, self.tag)

    def _extra_build(self):
        df_location = os.path.dirname(self.dockerfile)
        if os.path.isfile(os.path.join(df_location, 'build.sh')):
            self.extra = True
        else:
            self.extra = False

def update_images_to_rebuild(rebuild_all, changed_files=None):
    if rebuild_all or not changed_files:
        print('Rebuilding all images')
        images_to_rebuild.update([image.full_name for image in all_images.values()])
    else:
        print('Selecting images for rebuild')
        for cf in changed_files:
            for image in all_images.values():
                if image.name in cf:
                    if image.versioned and image.tag not in cf:
                        print("Won't add {0} as nothing changed for this tag".format(image.full_name))
                        continue
                    print('Adding {0} because {1} has changed'.format(image.full_name, cf))
                    images_to_rebuild.add(image.full_name)
            if len(images_to_rebuild) != len(all_images):
                for image in all_images.values():
                    if image.parent_name in images_to_rebuild:
                        print("Adding {0} because it's parent ({1}) has changed".format(image.full_name, image.parent_name))
                        images_to_rebuild.add(image.full_name)

def add_image_ordered(image_name):
    image = all_images[image_name]
    if image.parent_name in images_to_rebuild:
        parent_image = all_images[image.parent_name]
        add_image_ordered(parent_image.full_name)
    if image not in sorted_images_to_rebuild:
        sorted_images_to_rebuild.append(image)

all_images = {}
images_to_rebuild = set()
sorted_images_to_rebuild = []

parser = ArgumentParser()
parser.add_argument('-a', '--rebuild-all')
parser.add_argument('-f', '--changed-files')
parser.add_argument('-t', '--dry-run')
args = parser.parse_args()
rebuild_all = args.rebuild_all == '1'
changed_files = []
dry_run = False
if args.dry_run and args.dry_run == '1':
    dry_run = True
if args.changed_files:
        changed_files = args.changed_files.split('\n')
print(changed_files)

dockerfiles = glob("./*/Dockerfile")
dockerfiles_versioned = glob("./*/*/Dockerfile")

for df in dockerfiles:
    image = DockerImage(df)
    all_images[image.full_name] = image

for df in dockerfiles_versioned:
    image = DockerImage(df, versioned=True)
    all_images[image.full_name] = image

update_images_to_rebuild(rebuild_all, changed_files)

for image_name in images_to_rebuild:
    add_image_ordered(image_name)

if not sorted_images_to_rebuild:
    print('No images need to be rebuilt')
else:
    print('These images will be rebuilt (in this order): ' + ', '.join([image.full_name for image in sorted_images_to_rebuild]))
    for image in sorted_images_to_rebuild:
        print('Building ' + image.full_name)
        if dry_run:
            print('!!! Warning: Skipping image build due to DRY-RUN mode. Would have built: {0}'.format(image.full_name))
            return_code = 0
        else:
            if image.extra:
                return_code = subprocess.call(os.path.join(image.dockerfile_folder,"build.sh"), shell=True)
                if return_code != 0:
                    print('Error building {0}'.format(image.full_name))
                    sys.exit(1)
            else:
                args_build = ["docker", "build", "-t", image.full_name, "-f", image.dockerfile, image.dockerfile_folder]
                args_cat = ["cat"]
                process_build = subprocess.Popen(args_build, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, shell=False)
                process_cat = subprocess.Popen(args_cat, stdin=process_build.stdout, stdout=subprocess.PIPE, shell=False)
                process_build.stdout.close()
                output = process_cat.communicate()[0]
                print(output)
                return_code = process_build.wait()
                if return_code != 0:
                    print('Error building {0}'.format(image.full_name))
                    sys.exit(1)
                print("Squashing {0}...".format(image.full_name))
                subprocess.call("docker save {0} > \"/tmp/{1}.tar\"".format(image.full_name, image.name), shell=True)
                subprocess.call("sudo docker-squash -i \"/tmp/{0}.tar\" -o \"/tmp/{0}-squashed.tar\"".format(image.name), shell=True)
                subprocess.call("cat \"/tmp/{0}-squashed.tar\" | docker load".format(image.name), shell=True)
                print("Squashed {0}".format(image.full_name))

    tmp_image_file = open("/tmp/images", 'w')
    tmp_image_file.write('{0}'.format(" ".join([image.full_name for image in sorted_images_to_rebuild])))
