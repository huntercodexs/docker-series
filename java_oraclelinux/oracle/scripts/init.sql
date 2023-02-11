CREATE DATABASE dbname;

CREATE USER docker WITH PASSWORD 'oracle1Ipw!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to docker;

CREATE USER devel WITH PASSWORD 'oracle1Ipw!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to devel;

CREATE USER test WITH PASSWORD 'oracle1Ipw!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to test;

CREATE TABLE customers (
   id number(19,0) NOT NULL,
   age number(10,0),
   email varchar2(255 CHAR),
   name varchar2(255 CHAR),
   PRIMARY KEY (id)
)

INSERT INTO users (id, name, age) VALUES ('94734987', 'John Smith Suisse', 35);
INSERT INTO users (id, name, age) VALUES ('12734983', 'Wanda Guest Vaz', 27);
