
CREATE TABLE `customers` (
    `id` bigint NOT NULL AUTO_INCREMENT,
        `age` int DEFAULT NULL,
        `email` varchar(255) DEFAULT NULL,
        `name` varchar(255) DEFAULT NULL,
        PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO customers (name, email, age) VALUES ('Amanda Barros', 'amanda@email.com', 33);
INSERT INTO customers (name, email, age) VALUES ('Marcos Silva', 'marcos@email.com', 34);
