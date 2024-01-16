# NODEJS + ANGULAR

> NOTE: The current version used in this repository is 18.13.0

- Before run this project (nodejs + angular)

Ensure that all files from the Angular Project has been generated and placed in the app folder, mainly the 
node_modules folder library.

- Set up the file .env

<pre>
##############################################################################
#### NODEJS SETTINGS
##############################################################################
NODEJS_PORT1=34200
NODEJS_PORT2=39000
ANGULAR_PROJECT_NAME=sample-angular-project
</pre>

- Run nodejs + angular from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/nodejs/18.13.0-angular
user@host:/home/user/docker-series/self-containers/nodejs/18.13.0-angular$ docker network create open_network
user@host:/home/user/docker-series/self-containers/nodejs/18.13.0-angular$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/nodejs/18.13.0-angular$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/nodejs/18.13.0-angular$ docker-compose start
</pre>

- Access and test application

Example

<pre>
Initial Chunk Files | Names         |  Raw Size
polyfills.js        | polyfills     |  83.46 kB |
main.js             | main          |  22.29 kB |
styles.css          | styles        |  95 bytes |

                    | Initial Total | 105.85 kB

Application bundle generation complete. [1.382 seconds]
Watch mode enabled. Watching for file changes...
  ➜  Local:   http://localhost:4200/
  ➜  Network: http://172.17.0.2:4200/
</pre>

- If you need to know which is the IP to access application, try this to see in the logs

<pre>
user@host:/home/user/docker-series/self-containers/nodejs/18.13.0-angular$ docker-compose logs nodejs-angular

nodejs-angular    | Initial Chunk Files | Names         |  Raw Size
nodejs-angular    | polyfills.js        | polyfills     |  83.46 kB | 
nodejs-angular    | main.js             | main          |  22.29 kB | 
nodejs-angular    | styles.css          | styles        |  95 bytes | 
nodejs-angular    | 
nodejs-angular    |                     | Initial Total | 105.85 kB
nodejs-angular    | 
nodejs-angular    | Application bundle generation complete. [1.398 seconds]
nodejs-angular    | Watch mode enabled. Watching for file changes...
nodejs-angular    |   ���  Local:   http://localhost:4200/
nodejs-angular    |   ���  Network: http://192.168.80.2:4200/
nodejs-angular    |   ���  Network: http://192.168.96.2:4200/

nodejs-angular    | Initial Chunk Files | Names | Raw Size
nodejs-angular    | main.js             | main  | 22.30 kB | 
nodejs-angular    | 
nodejs-angular    | Unchanged output files: 2
nodejs-angular    | Application bundle generation complete. [0.146 seconds]
nodejs-angular    | Page reload sent to client(s).

nodejs-angular    | Initial Chunk Files | Names | Raw Size
nodejs-angular    | main.js             | main  | 22.29 kB | 
nodejs-angular    | 
nodejs-angular    | Unchanged output files: 2
nodejs-angular    | Application bundle generation complete. [0.118 seconds]
nodejs-angular    | Page reload sent to client(s).
</pre>

