# MONGODB

> BEFORE RUN

Edit the .env file to create correctly to Mongo Express and MongoDB access.

> BUILD AND RUN

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/microsoft
docker-compose up --build mongo mongo-express (in first time)
docker-compose start mongo mongo-express (in others case)
</pre>

> AFTER BUILD

- Access the MongoDB Express

<pre>
http://${WEBSERVER_ADDRESS}:38091/
  username: ${MONGO_EXPRESS_USERNAME}
  password: ${MONGO_EXPRESS_PASSWORD}
</pre>

- Create a database: dbname

![img.png](./midias/Mongo-Express-Dashboard.png)

- Create a collection: users
- Create a documents(index): id, name
