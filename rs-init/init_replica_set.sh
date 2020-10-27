function getContainerIpAddress(){
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$1"	
}
MONGO_HOST_1=mongo-replica-set-docker_mongo_1
MONGO_IP_1=$(getContainerIpAddress $MONGO_HOST_1)
MONGO_IP_2=$(getContainerIpAddress "mongo-replica-set-docker_mongo_2")
MONGO_IP_3=$(getContainerIpAddress "mongo-replica-set-docker_mongo_3")
mongo --host $MONGO_HOST_1 <<EOF
config = {
    _id: "rs0",
    members: [
        {
            _id: 0,
            host: "${MONGO_IP_1}"
        },
        {
            _id: 1,
            host: "${MONGO_IP_2}",
            priority: 0,
            slaveDelay: 10
        },
        {
            _id: 2,
            host: "${MONGO_IP_3}",
            priority: 2
        }
      ]
}
var result = rs.initiate(config)
printjson(result)
EOF
