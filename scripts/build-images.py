import os, re

from argparse import ArgumentParser
from glob import glob
from subprocess import call

class DockerImage:
    def __init__(self, dockerfile, versioned=False):
        self.dockerfile = dockerfile
        self.dockerfile_folder = os.path.dirname(self.dockerfile)
        self.versioned = versioned
        self._set_name()
        self._set_parent_name()

    def _set_parent_name(self):
        df = open(self.dockerfile).read()
        m = re.search('FROM\s+([a-z0-9\/\-\:]+)', df)
        self.parent_name = (m.group(1)).strip()

    def _set_name(self):
        df_location = os.path.dirname(self.dockerfile)
        self.name = os.path.split(df_location)[1]
        self.full_name = "apiaryio/" + self.name

        if self.versioned:
            self.tag = self.name
            self.name = os.path.split(os.path.dirname(df_location))[1]
            self.full_name = "apiaryio/{0}:{1}".format(self.name, self.tag)

def update_images_to_rebuild(rebuild_all, changed_files=None):
    if rebuild_all or not changed_files:
        print('Rebuilding all images')
        images_to_rebuild.update([image.full_name for image in all_images.values()])
    else:
        print('Selecting images for rebuild')
        for cf in changed_files:
            if 'scripts/' in cf:
                print('A core script has changes, rebuilding all images...')
                update_images_to_rebuild(True, all_images)
                break
            else:
                for image in all_images.values():
                    if image.name in cf or (image.versioned and image.tag in cf):
                        print('Adding {0} because {1} has changed'.format(image.full_name, cf))
                        images_to_rebuild.add(image.full_name)
            if len(images_to_rebuild) != len(all_images):
                for image in all_images.values():
                    if image.parent_name in images_to_rebuild:
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
args = parser.parse_args()
rebuild_all = args.rebuild_all == '1'
changed_files = []
if args.changed_files:
        changed_files = args.changed_files.split('\n')

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
        return_code = call("docker build -t {0} -f {1} {2}".format(image.full_name, image.dockerfile, image.dockerfile_folder), shell=True)
        if return_code != 0:
            print('Error building {0}')
            break
        print("Squashing {0}...".format(image.full_name))
        call("docker save {0} > \"/tmp/{1}.tar\"".format(image.full_name, image.name), shell=True)
        call("sudo docker-squash -i \"/tmp/{0}.tar\" -o \"/tmp/{0}-squashed.tar\"".format(image.name), shell=True)
        call("cat \"/tmp/{0}-squashed.tar\" | docker load".format(image.name), shell=True)
        print("Squashed {0}".format(image.full_name))
    
    tmp_image_file = open("/tmp/images", 'w')
    tmp_image_file.write('"{0}"'.format(" ".join([image.full_name for image in sorted_images_to_rebuild])))
