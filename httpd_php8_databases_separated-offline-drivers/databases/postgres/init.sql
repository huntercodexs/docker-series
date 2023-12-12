
CREATE TABLE customers (
    id serial NOT NULL,
    name VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    age INTEGER,
    PRIMARY KEY (id)
);

INSERT INTO customers (id, name, email, age) VALUES ('94734987', 'John Smith Wiz', 'john@email.com', 33);
INSERT INTO customers (id, name, email, age) VALUES ('12734983', 'Solange Smart Wow', 'sol@email.com', 34);
SELECT * FROM customers;

