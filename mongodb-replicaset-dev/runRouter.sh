sudo docker run \
  -P -name mongos1 \
  -d apiaryio/base-dev-mongodb-shard \
  --port 27017 \
  --configdb \
    <IP_of_container_cfg1>:27017, \
    <IP_of_container_cfg2>:27017, \
    <IP_of_container_cfg3>:27017
