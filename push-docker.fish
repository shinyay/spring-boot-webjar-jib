#!/usr/bin/env fish

if not set -q argv[1]
  echo 'push-docker.fish <DOCKERHUB_USER_NAME> <DOCKERHUB_USER_PASSWORD>'
else if not set -q argv[2]
  echo 'push-docker.fish DOCKERHUB_USER_NAME <DOCKERHUB_USER_PASSWORD>'
else
  ./mvnw compile jib:build -Djib.to.auth.username=$argv[1] -Djib.to.auth.password=$argv[2]
end
