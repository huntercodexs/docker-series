# SQLITE3

- How to run sqlite3 from this project use

<pre>
user@host:/home/user$ git clone https://github.com/huntercodexs/docker-series.git .
user@host:/home/user$ cd docker-series/self-containers/sqlite3
user@host:/home/user/docker-series/self-containers/sqlite3$ docker-compose up --build
user@host:/home/user/docker-series/self-containers/sqlite3$ [Ctrl+C]
user@host:/home/user/docker-series/self-containers/sqlite3$ docker-compose start
</pre>

- Prepare and access the sqlite database

<pre>
user@ubuntu-desktop:~/Server/Devel/docker-series/self-containers/sqlite3$ docker exec -it sqlite3 /bin/bash
root@0fe895af4841:/opt/sqlite3# cd /root/db/
root@0fe895af4841:/opt/db# sqlite3 dbname1.db
SQLite version 3.34.1 2021-01-20 14:10:07
Enter ".help" for usage hints.
sqlite> CREATE TABLE users(
    id INT PRIMARY KEY NOT NULL UNIQUE,
    name TEXT NOT NULL
);
sqlite> INSERT INTO users(id, name) VALUES (1, 'John Smith Wiz');
sqlite> SELECT * FROM users;
1|John Smith Wiz
sqlite> .quit
</pre>