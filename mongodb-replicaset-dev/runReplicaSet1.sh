sudo docker run \
  -P -name rs1_srv1 \
  -d apiaryio/base-dev-mongodb \
  --replSet rs1 \
  --noprealloc --smallfiles

sudo docker run \
  -P -name rs1_srv2 \
  -d apiaryio/base-dev-mongodb \
  --replSet rs1 \
  --noprealloc --smallfiles

sudo docker run \
  -P -name rs1_srv3 \
  -d apiaryio/base-dev-mongodb \
  --replSet rs1 \
  --noprealloc --smallfiles
