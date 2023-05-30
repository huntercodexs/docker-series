
DROP TABLE IF EXISTS PRODUCTS;

CREATE TABLE PRODUCTS (
    id INT AUTO_INCREMENT,
    name VARCHAR(50),
    description VARCHAR(150),
    price VARCHAR(10)
);

DROP TABLE IF EXISTS SALES;

CREATE TABLE SALES (
    id INT AUTO_INCREMENT,
    product VARCHAR(50),
    quantity VARCHAR(50),
    total VARCHAR(10)
);

INSERT INTO products (id, name, description, price) VALUES (1, 'Plastic Bags', 'Plastic bags to shopping', '40,00');
INSERT INTO products (id, name, description, price) VALUES (2, 'Wallet Plan', 'Money Wallet', '20,00');

INSERT INTO sales (id, product, quantity, total) VALUES (1, 'Plastic Bags', '3', '120,00');
INSERT INTO sales (id, product, quantity, total) VALUES (2, 'Wallet Plan', '2', '80,00');
