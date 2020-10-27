# mongo-replica-set-docker
how to run it:
- docker-compose up
- docker run -it --rm --network mongo-network -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v $(pwd)/rs-init:/rs-init mongo bash /rs-init/init_replica_set.sh

#### Make sure the parent directory is 'mongo-replica-set-docker' otherwise docker-compose will generate different host names and container names

### How to load some data:
- docker exec mongo-replica-set-docker_mongo_1 mongoimport --db playground --collection zips --file /init-data/zips.json
