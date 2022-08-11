
# isql-fb
SQL>CREATE DATABASE '/etc/firebird/3.0/databases/dbname1.fdb'
CON>user 'SYSDBA' password 'masterkey';

CREATE TABLE users (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL
);

INSERT INTO users (id, name) VALUES ('94734987', 'John Smith Suisse');
INSERT INTO users (id, name) VALUES ('12734983', 'Wanda Guest Vaz');

SELECT * FROM users;
