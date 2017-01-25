## ARMv7 - Build in RaspberryPi 2
-----
### Latest image (Alpine Linux)
##### Pull image
```
docker pull izone/arm
```
##### Run pulled image
```
docker run --rm --name Alpine -ti izone/arm ash
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm .
```

### LLMP stack (Linux, Lighttpd, MariaDB, PHP5)
##### MaridDB 10.1
```
docker run --name MariaDB -h mariadb \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=maria \
-d izone/arm:mariadb
```
##### PHP 5.6 and Lighttpd
```
docker run --name Php -h php \
--link MariaDB:mariadb-host \
-p 80:80 \
-v $HOME/www:/var/www \
-d izone/arm:php
```

### Openjdk 8
##### Pull image
```
docker pull izone/arm:openjdk
```
##### Run pulled image
```
docker run --rm --name OpenJDK -ti izone/arm:openjdk java -version
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:openjdk ./openjdk/
```

### Tomcat 8.0.39
##### Pull image
```
docker pull izone/arm:tomcat
```
##### Run pulled image
```
docker run --rm --name Tomcat -h tomcat \
-e PASS="admin" \
-p 8080:8080 \
-ti izone/arm:tomcat

docker run -name Tomcat -h tomcat \
-e PASS="admin" \
-p 8080:8080 \
-d izone/arm:tomcat

docker run -name Tomcat -h tomcat \
--link MariaDB:mariadb-host \
-e PASS="admin" \
-p 8080:8080 \
-d izone/arm:tomcat
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:tomcat ./tomcat/
```

### MySQL (MariaDB)
##### Pull image
```
docker pull izone/arm:mariadb
```
##### Run pulled image
```
docker run --rm --name MariaDB -h mariadb \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=maria \
-ti izone/arm:mariadb

docker run --name MariaDB -h mariadb \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=maria \
-d izone/arm:mariadb

docker logs -f MariaDB

docker exec -ti MariaDB mysql -u root -pmaria

CREATE DATABASE dbzone;
CREATE USER 'luvres'@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON dbzone.* TO 'luvres'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
-- -------------
DROP USER luvres;
mysql --user=luvres --password=p4sS dbzone
mysql -u luvres -pp4sS dbzone
select user, host from mysql.user;
SHOW GRANTS FOR usuario;
select user();
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:mariadb ./mariadb/
```

### Postgres 9.5.5
##### Pull image
```
docker pull izone/arm:postgres
```

##### Run pulled image
```
docker run --name Postgres -h postgres \
-p 5432:5432 \
-e POSTGRES_PASSWORD=postgres \
-d izone/arm:postgres

docker logs -f Postgres

docker exec -ti Postgres bash -c "su postgres"

createdb dbzone
psql -U postgres
create user luvres with password 'pass';
alter database dbzone owner to luvres;
---------------
alter user luvres password 'p4sS';
drop user luvres;
\du
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:postgres ./postgres/
```

### Lighttpd
##### Pull image
```
docker pull izone/arm:lighttpd
```
##### Run pulled image
```
mkdir $HOME/www

docker run --rm --name Lighttpd -h lighttpd \
-p 80:80 \
-v $HOME/www:/var/www \
-ti izone/arm:lighttpd
```
##### Browser access
```
http://localhost/
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:lighttpd ./lighttpd/
```

### PHP 5.6 and Lighttpd
##### Pull image
```
docker pull izone/arm:php
```
##### Run pulled image
```
mkdir $HOME/www

docker run --rm --name Php -h php \
-p 80:80 \
-v $HOME/www:/var/www \
-ti izone/arm:php

docker run --rm --name Php -h php \
--link MariaDB:mariadb-host \
-p 80:80 \
-v $HOME/www:/var/www \
-ti izone/arm:php
```
##### Browser access
```
http://localhost/
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:php ./php/
```

### Owncloud
##### Pull image
```
docker pull izone/arm:owncloud
```
##### Run pulled image
```
docker run --rm --name Owncloud -h ounclowd \
-p 80:80 \
-ti izone/arm:owncloud
```
##### Browser access
```
http://localhost/
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:owncloud ./owncloud/
```


-----
### Debian jessie
##### Pull image
```
docker pull izone/arm:debian
```
##### Run pulled image
```
docker run --rm --name Debian -ti izone/arm:debian bash
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:debian ./debian/
```

### PHP 5.6 and Apache
##### Pull image
```
docker pull izone/arm:php56
```
##### Run pulled image
```
mkdir $HOME/www

docker run --rm --name Php -h php -p 80:80 -v $HOME/www:/var/www/html izone/arm:php56
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:php56 ./debian/php56/
```


-----
### AUTO CONSTRUCTION creation sequence
##### Base
```
docker build -t izone/arm .
```
### Databases
```
docker build -t izone/arm:mariadb ./mariadb/ && \
docker build -t izone/arm:postgres ./postgres/
```
### Web Servers
```
docker build -t izone/arm:lighttpd ./lighttpd/ && \
docker build -t izone/arm:php ./php/ && \
docker build -t izone/arm:owncloud ./owncloud/
```
### Web Servers Java
```
docker build -t izone/arm:openjdk ./openjdk/ && \
docker build -t izone/arm:tomcat ./tomcat/ && \
docker build -t izone/arm:wildfly ./wildfly/

docker build -t izone/arm:wildfly8 ./wildfly/8.2.1.Final/

docker build -t izone/arm:openjdk7 ./openjdk/openjdk7/
```
