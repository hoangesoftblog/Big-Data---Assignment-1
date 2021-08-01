docker-compose -f data-vis/docker-compose.yml down -v --rmi local & 

docker-compose -f bitcoin-producer/docker-compose.yml down -v --rmi local & 

@REM docker-compose -f faker-producer/docker-compose.yml down -v --rmi local & 

@REM docker-compose -f owm-producer/docker-compose.yml down -v --rmi local & 
@REM docker-compose -f twitter-producer/docker-compose.yml  down -v --rmi local &
docker-compose -f consumers/docker-compose.yml down -v --rmi local &  
docker-compose -f kafka/docker-compose.yml down -v --rmi local & 
docker-compose -f cassandra/docker-compose.yml down -v --rmi local &
docker image rm bootstrapcassandra &
@REM docker network rm cassandra-network &
@REM docker network rm cassandra-network &
echo "Done."

