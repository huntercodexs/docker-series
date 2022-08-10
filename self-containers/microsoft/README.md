# MSSQL

- To run mssql from this project use

<pre>
git clone https://github.com/huntercodexs/docker-series.git .
cd self-containers/microsoft
docker-compose up --build mssql mssql-tools (in first time)
docker-compose start mssql mssql-tools (in others case)
</pre>

- Access the database

<pre>
server: 192.168.0.174
port: 1433
user: SA
pass: mssql1Ipw
</pre>