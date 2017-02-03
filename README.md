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

### ALMPP stack (Alpine, Lighttpd, MariaDB, Postgres, PHP)
##### MariaDB 10.1
```
docker run --name MariaDB -h mariadb \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=maria \
-d izone/arm:mariadb
```
##### PHP 5.6 and Lighttpd
```
mkdir $HOME/www

docker run --name Php -h php \
--link MariaDB:mariadb-host \
-p 80:80 \
-v $HOME/www:/var/www \
-d izone/arm:php
```
##### PHP 7 and Lighttpd
```
mkdir $HOME/www

docker run --name Php -h php \
--link MariaDB:mariadb-host \
-p 80:80 \
-v $HOME/www:/var/www \
-d izone/arm:php
```
##### Browser access
```
http://localhost/
```
### phpMyAdmin
##### Usage with linked server
```
docker run --rm --name Myadmin -h phpmyadmin \
--link MariaDB:db \
-p 8080:80 \
-ti izone/arm:phpmyadmin
```
##### Usage with external server
```
docker run --rm --name Myadmin -h phpmyadmin \
-e PMA_HOST=191.96.255.100 \
-p 8080:80 \
-ti izone/arm:phpmyadmin
```
##### Browser access
```
http://localhost:8080/
```
##### Official phpMyAdmin Docker image
##### https://github.com/phpmyadmin/docker

-----
### Openjdk 8
##### Pull image
```
docker pull izone/arm:openjdk
```
##### Run pulled image
```
docker run --rm --name OpenJDK \
-ti izone/arm:openjdk java -version
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:openjdk ./openjdk/
```

### Tomcat 8.0.41
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

### Windfly 10.1.0 Final
##### Pull image
```
docker pull izone/arm:wildfly
```
##### Run pulled image
```
docker run --rm --name Wildfly -h wildfly \
-e PASS="admin" \
-p 8080:8080 \
-p 9990:9990 \
-ti izone/arm:wildfly

docker run --name Wildfly -h wildfly \
--link MariaDB:mariadb-host \
-e PASS="admin" \
-p 8080:8080 \
-p 9990:9990 \
-d izone/arm:wildfly
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:wildfly ./wildfly/
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
### pgAdmin
```
docker run -ti --name PgAdmin -h pgadmin \
--link Postgres:postgres \
-p 5050:5050 \
-ti izone/arm:pgadmin
```
##### Browser access
```
http://localhost:5050/
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:pgadmin ./pgadmin/
```
##### References
##### https://github.com/docker-library/python
##### https://github.com/fenglc/dockercloud-pgAdmin4


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
### PHP 7 and Lighttpd
##### Pull image
```
docker pull izone/arm:php7
```
##### Run pulled image
```
mkdir $HOME/www

docker run --rm --name Php -h php \
-p 80:80 \
-v $HOME/www:/var/www \
-ti izone/arm:php7

docker run --rm --name Php -h php \
--link MariaDB:mariadb-host \
--link Postgres:postgres-host \
-p 80:80 \
-v $HOME/www:/var/www \
-ti izone/arm:php7
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

docker build -t izone/arm:php7 ./php7/

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
docker pull izone/arm:jessie
```
##### Run pulled image
```
docker run --rm --name Debian -ti izone/arm:jessie cat /etc/debian_version
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:jessie ./jessie/
```
-----
##### Procedure used for debian images
```
git clone https://github.com/docker/docker.git
cd docker/contrib

sudo ./mkimage.sh -d . debootstrap --variant=minbase --components=main 
--include=inetutils-ping,iproute2  jessie http://httpredir.debian.org/debian

docker build -t izone/arm:jessie .
```
##### References for building docker images for ARM architecture
##### https://github.com/docker/docker
##### https://hub.docker.com/r/armv7/armhf-debian/
##### https://github.com/tianon/docker-brew-debian

-----
### AUTO CONSTRUCTION creation sequences
#### Base (Alpine)
```
docker build -t izone/arm .
```
#### Databases
```
docker build -t izone/arm:mariadb ./mariadb/ && \
docekr build -t izone/arm:phpmyadmin ./phpmyadmin/

docker build -t izone/arm:postgres ./postgres/ && \
docker build -t izone/arm:python2 ./python2/ && \
docker build -t izone/arm:pgadmin ./pgadmin/
```
#### Web Servers
```
docker build -t izone/arm:lighttpd ./lighttpd/ && \
docker build -t izone/arm:php ./php/ && \
docker build -t izone/arm:php7 ./php7/

docker build -t izone/arm:owncloud ./owncloud/
```
#### Web Servers Java
```
docker build -t izone/arm:openjdk ./openjdk/ && \
docker build -t izone/arm:tomcat ./tomcat/ && \
docker build -t izone/arm:wildfly ./wildfly/

docker build -t izone/arm:wildfly8 ./wildfly/8.2.1.Final/

docker build -t izone/arm:openjdk7 ./openjdk/openjdk7/
```
