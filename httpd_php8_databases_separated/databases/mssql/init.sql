-- demo.dbo.customers definition

-- Drop table

-- DROP TABLE demo.dbo.customers;

CREATE TABLE demo.dbo.customers (
    id bigint IDENTITY(1,1) NOT NULL,
    name varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    email varchar(255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
    age int NULL,
    CONSTRAINT PK__customer__3213E83F145A0C82 PRIMARY KEY (id)
);

INSERT INTO customers (name, email, age) VALUES ('Amanda Barros', 'amanda@email.com', 33);
INSERT INTO customers (name, email, age) VALUES ('Marcos Silva', 'marcos@email.com', 34);