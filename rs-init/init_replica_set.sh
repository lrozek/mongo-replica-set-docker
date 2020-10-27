function getContainerIpAddress(){
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"	
}

MONGO_HOST_1=$(getContainerIpAddress "mongo-replica-set-docker_mongo_1")
MONGO_HOST_2=$(getContainerIpAddress "mongo-replica-set-docker_mongo_2")
MONGO_HOST_3=$(getContainerIpAddress "mongo-replica-set-docker_mongo_3")
cat <<EOF > rs-init/init_replica_set.js
config = {
    _id: "rs0",
    members: [
        {
            _id: 0,
            host: "${MONGO_HOST_1}"
        },
        {
            _id: 1,
            host: "${MONGO_HOST_2}",
            priority: 0,
            slaveDelay: 10
        },
        {
            _id: 2,
            host: "${MONGO_HOST_3}",
            priority: 2
        }
      ]
}
var result = rs.initiate(config)
printjson(result)
EOF
docker exec -w /rs-init mongo-replica-set-docker_mongo_1 mongo init_replica_set.js