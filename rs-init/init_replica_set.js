config = {
    _id: "rs0",
    members: [
        {
            _id: 0,
            host: "mongo-replica-set-docker_mongo_1"
        },
        {
            _id: 1,
            host: "mongo-replica-set-docker_mongo_2"
        },
        {
            _id: 2,
            host: "mongo-replica-set-docker_mongo_3"
        }
      ]
}
rs.initiate(config)