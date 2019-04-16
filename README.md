# Name



## Description
This project is created which is based on [docker-maven-spring-boot-template](https://github.com/shinyay/docker-maven-spring-boot-template)

## Demo

## Features

- feature:1
- feature:2

## Requirement

## Usage

### Build DockerImage

```
$ ./mvnw clean compile jib:dockerBuild
```

### Push DockerImage into Docker Hub

```
./mvnw compile jib:build -Djib.to.auth.username=$DOCKERHUB_USER -Djib.to.auth.password=$DOCKERHUB_PASSWORD
```

### Run Docker Container

```
$ docker run --rm -p 8080:8080 -v (pwd)/log:/app/log shinyay/springboot-webjar:jib
```

## Installation

## Licence

Released under the [MIT license](https://gist.githubusercontent.com/shinyay/56e54ee4c0e22db8211e05e70a63247e/raw/44f0f4de510b4f2b918fad3c91e0845104092bff/LICENSE)

## Author

[shinyay](https://github.com/shinyay)
