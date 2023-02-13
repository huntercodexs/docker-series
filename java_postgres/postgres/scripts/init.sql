
CREATE DATABASE dbname;

CREATE USER docker WITH PASSWORD '123Mudar!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to docker;

CREATE USER devel WITH PASSWORD '123Mudar!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to devel;

CREATE USER test WITH PASSWORD '123Mudar!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to test;

CREATE TABLE customers (
    id serial NOT NULL,
    name VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    age INTEGER,
    PRIMARY KEY (id)
);

INSERT INTO customers (id, name, age) VALUES ('94734987', 'Amanda Barros', 33);
INSERT INTO customers (id, name, age) VALUES ('12734983', 'Marcos Silva', 34);
