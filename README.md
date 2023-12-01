# OPENJDK-8u212 + MYSQL8
Docker Series - A project to work with many docker container


# Information

Please use the branch selection to access others configurations to most need and purposes


# Dockers Configurations Contained

- OpenJDK-8-212
- Mysql 8.0

NOTE: JUST WORK WITH JAR FILE !
After changes in the current project and generated jar file, copy it inside to docker container openjdk
and run the command "docker-compose up openjdk-8u212" to feature update or execute directly command as 
docker exec -it openjdk-8u212 java -jar /home/openjdk/simple-api-demo/SIMPLE-API-DEMO-22.01.1-SNAPSHOT.jar

request sample: http://192.168.0.174:31890/api/simple-api-demo
response: OK, it is working fine !