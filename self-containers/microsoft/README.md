
# MSSQL + MSSQL-TOOLS

- How to run microsoft mssql from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/microsoft
user@host:/home/user/docker-series/self-containers/microsoft$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/microsoft$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/microsoft$ docker-compose start
</pre>

- Set up the .env file as below

<pre>
# Set the port to MSSQL
MSSQL_PORT=1433
MSSQL_TOOLS_PORT=31812

# Set database access (strong)
MSSQL_USERNAME=SA
MSSQL_SA_PASSWORD=mssql1Ipw

# Set license accept (Y/N)
MSSQL_ACCEPT_EULA=Y

# Set the current use for this image container
# (Developer, Express, Standard, Enterprise, EnterpriseCore)
MSSQL_EDITION=Express
MSSQL_TRUSTED_CONNECTION=true
</pre>

- Access the database

<pre>
server: 192.168.0.204
port: 1433
user: SA
pass: mssql1Ipw
</pre>
