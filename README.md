# mongo-replica-set-docker
how to run it:
- docker-compose up
- docker exec -w /rs-init mongo-replica-set-docker_mongo_1 mongo init_replica_set.js

#### Make sure the parent directory is 'mongo-replica-set-docker' otherwise docker-compose will generate different host names and container names

### How to load some data:
- docker exec mongo-replica-set-docker_mongo_1 mongoimport --db playground --collection zips --file /init-data/zips.json
