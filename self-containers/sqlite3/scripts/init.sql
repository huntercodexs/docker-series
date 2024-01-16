Firstly run the command bellow in the terminal to create an database: ex: sqlite.db
root@c0b363cafda2:/# sqlite3 sqlite_test_1.db
SQLite version 3.31.1 2020-01-27 19:55:54
Enter ".help" for usage hints.
sqlite> CREATE TABLE users(
   ...>     id INT PRIMARY KEY NOT NULL UNIQUE,
   ...>     name TEXT NOT NULL
   ...> );
sqlite> INSERT INTO users(id, name) VALUES (1, 'Paloma dos Santos');
sqlite> INSERT INTO users(id, name) VALUES (2, 'Jaime dos Santos');
sqlite> SELECT * FROM users;
1|Paloma dos Santos|30|paloma@email.com
2|Jaime dos Santos|32|jaime@email.com
sqlite>

CREATE TABLE users(
    id INT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL
);

INSERT INTO users(id, name) VALUES (1, 'John Smith Wiz');

SELECT * FROM users;

DROP TABLE users;