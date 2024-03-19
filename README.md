step 1 (run docker postgres container)
  
  docker run -d \       
    -p 5433:5432 \               
    -e POSTGRES_DB=docker_devops_learn \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=postgres \
    --name postgres-container-2 \
    postgres


step2:- build project docker image.
  
  docker build -t my-spring-boot-app .


NOTE:- step 2 is failing in ./gradlew build    step of docker image creation, but failing on same step when building docker image.
