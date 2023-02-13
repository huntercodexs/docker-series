
CREATE DATABASE dbname;

CREATE USER docker WITH PASSWORD '123Mudar!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to docker;

CREATE USER devel WITH PASSWORD '123Mudar!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to devel;

CREATE USER test WITH PASSWORD '123Mudar!';
GRANT ALL PRIVILEGES ON DATABASE "dbname" to test;

CREATE TABLE customers (
    id SERIAL NOT NULL,
    age INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO customers (id, name, age) VALUES ('94734987', 'Amanda Barros', 33);
INSERT INTO customers (id, name, age) VALUES ('12734983', 'Marcos Silva', 34);
