sudo docker run \
  -P -name rs2_srv1 \
  -d apiaryio/base-dev-mongodb \
  --replSet rs2 \
  --noprealloc --smallfiles

sudo docker run \
  -P -name rs2_srv2 \
  -d apiaryio/base-dev-mongodb \
  --replSet rs2 \
  --noprealloc --smallfiles

sudo docker run \
  -P -name rs2_srv3 \
  -d apiaryio/base-dev-mongodb \
  --replSet rs2 \
  --noprealloc --smallfiles
