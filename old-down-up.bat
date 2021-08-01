@REM docker-compose -f data-vis/docker-compose.yml down -v --rmi local & 

docker-compose -f kafka/docker-compose.yml down -v --rmi local & 

docker-compose -f kafka/docker-compose.yml up -d --build --force-recreate & 

@REM docker-compose -f bitcoin-producer/docker-compose.yml up -d --build --force-recreate & 
@REM docker-compose -f consumers/docker-compose.yml up -d --build --force-recreate &

@REM docker-compose -f consumers/docker-compose.yml down -v --rmi local & 
@REM docker-compose -f bitcoin-producer/docker-compose.yml down -v --rmi local & 
echo "Done."

