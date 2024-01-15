# MONGODB

- Set up the self-containers/mongodb/mongo/mongod.conf

- Create on folder MongoDB inside self-containers/mongodb/mongo

- How to run mongodb from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/mongodb
user@host:/home/user/docker-series/self-containers/mongodb$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/mongodb$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/mongodb$ docker-compose start
</pre>

- Set up the .env file as below

<pre>
##############################################################################
#### MONGO SETTINGS
##############################################################################

# Set the port to MONGO
MONGO_PORT=27017

# Set mongo username and password
MONGO_INIT_DB_ROOT_USERNAME=root
MONGO_INIT_DB_ROOT_PASSWORD=MongoDB2019!

##############################################################################
#### MONGO EXPRESS SETTINGS
##############################################################################

# Set the port to MONGO
MONGO_EXPRESS_PORT=38091

# Define express access by web
MONGO_EXPRESS_USERNAME=devel
MONGO_EXPRESS_PASSWORD=MongoExpress2019!

# Set a connection with Mongo Server
MONGO_EXPRESS_SERVER_DRIVER=mongo
MONGO_EXPRESS_SERVER_PORT=27017
MONGO_EXPRESS_SERVER_URL=mongo://root:MongoDB2019!@mongo:27017/
MONGO_EXPRESS_SERVER_USERNAME=root
MONGO_EXPRESS_SERVER_PASSWORD=MongoDB2019!
</pre>

- Access the MongoDB Express

<pre>
http://${WEBSERVER_ADDRESS}:38091/
username: ${MONGO_EXPRESS_USERNAME}
password: ${MONGO_EXPRESS_PASSWORD}
</pre>

- Create a database: dbname

![img.png](./media/Mongo-Express-Dashboard.png)

- Create a collection: users
- Create a documents(index): id, name

Enjoy !
