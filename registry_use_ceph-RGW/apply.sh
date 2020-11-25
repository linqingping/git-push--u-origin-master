docker stop docker-registry-manager && docker rm docker-registry-manager
docker stop registry && docker rm registry
docker run -d -p 5000:5000 --name registry -v ${PWD}/config-Us3.yml:/etc/docker/registry/config.yml registry:2
docker run -d --name docker-registry-manager -p 8181:8080 -v ${PWD}/registries.yml:/app/registries.yml -e MANAGER_PORT=8080 -e MANAGER_REGISTRIES=/app/registries.yml -e MANAGER_LOG_LEVEL=warn snagles/docker-registry-manager
