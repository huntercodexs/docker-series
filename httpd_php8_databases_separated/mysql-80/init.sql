CREATE TABLE users (
    id serial NOT NULL,
    name VARCHAR(250) NOT NULL,
    age INTEGER,
    PRIMARY KEY (id)
);

INSERT INTO users (id, name, age) VALUES ('94734987', 'Amanda Barros', 33);
INSERT INTO users (id, name, age) VALUES ('12734983', 'Marcos Silva', 34);

SELECT * FROM users;