sudo docker run \
  -P -name cfg1 \
  -d apiaryio/base-dev-mongodb \
  --noprealloc --smallfiles \
  --configsvr \
  --dbpath /data/db \
  --port 27017

sudo docker run \
  -P -name cfg2 \
  -d apiaryio/base-dev-mongodb \
  --noprealloc --smallfiles \
  --configsvr \
  --dbpath /data/db \
  --port 27017

sudo docker run \
  -P -name cfg3 \
  -d apiaryio/base-dev-mongodb \
  --noprealloc --smallfiles \
  --configsvr \
  --dbpath /data/db \
  --port 27017
