# Run mongodb cluster via docker

- https://sebastianvoss.com/docker-mongodb-sharded-cluster.html


1. Create the Replica Sets
  - runReplicaSet1
  - runReplicaSet2

2. Initialize the Replica Sets

Get ip address rs1:

  sudo docker inspect rs1_srv1
  sudo docker inspect rs1_srv2
  sudo docker inspect rs1_srv3

Connect to MongoDB running in container rs1_srv1 (you need the local port bound for 27017/tcp figured out in the previous step).

    # MongoDB shell

    rs.initiate()
    rs.add("<IP_of_rs1_srv2>:27017")
    rs.add("<IP_of_rs1_srv3>:27017")
    rs.status()

Docker will assign an auto-generated hostname for containers and by default MongoDB will use this hostname while initializing the replica set. As we need to access the nodes of the replica set from outside the container we will use IP adresses instead.

Use these MongoDB shell commands to change the hostname to the IP address.

    # MongoDB shell

    cfg = rs.conf()
    cfg.members[0].host = "<IP_of_rs1_srv1>:27017"
    rs.reconfig(cfg)
    rs.status()


3. Create some Config Servers

4. Create a Router

5. Initialize the Shard
