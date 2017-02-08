## ARMv7 - Build in RaspberryPi 2
### Alpine Linux
### Debian (Jessie, Wheezy)
### Ubuntu (Xenial, Trusty, Precise)
### Arch Linux

#### Openjdk 8
#### Tomcat 8.0.41
#### Windfly 10.1.0 Final

#### MySQL (MariaDB)
#### phpMyAdmin
#### Postgres (9.6.1, 9.5.5, 9.4.10, 9.3.15, 9.2.19)
#### pgAdmin

#### Lighttpd with PHP (5.6 and 7.0)

#### ALMPP stack instructions
#### (Alpine, Lighttpd, MariaDB, Postgres, PHP)

#### NodeJS
#### MongoDB 3.0.9
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
```
```
docker run --name Php -h php \
--link MariaDB:mariadb-host \
-p 80:80 \
-v $HOME/www:/var/www \
-d izone/arm:php7
```
##### or
```
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

### Postgres latest (9.6.1)
##### Pull image
```
docker pull izone/arm:postgres
docker pull izone/arm:postgres-9.6
docker pull izone/arm:postgres-9.6.1
```
##### Pull image 9.5.5
```
docker pull izone/arm:postgres-9.5
docker pull izone/arm:postgres-9.5.5
```
##### Run pulled image
```
docker run --name Postgres -h postgres \
-p 5432:5432 \
-e POSTGRES_PASSWORD=postgres \
-d izone/arm:postgres

docker exec -ti Postgres psql -U postgres -c "SELECT version();"

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

### Nodejs
#### Pull image options
##### Node latest (7.4.0)
```
docker pull izone/arm:node
docker pull izone/arm:node-7
docker pull izone/arm:node-7.4
```
##### Node 6.9.5
```
docker pull izone/arm:node-6
docker pull izone/arm:node-6.9
docker pull izone/arm:node-6.9.5
```
##### Node 4.7.3
```
docker pull izone/arm:node-4
docker pull izone/arm:node-4.7
docker pull izone/arm:node-4.7.3
```
##### Run pulled image
```
docker run --rm --name Node \
-v "$PWD":/usr/src/app \
-w /usr/src/app \
-ti izone/arm:node-4 node script.js
```
### MongoDB 3.0.9
##### Pull image
```
docker pull izone/arm:mongo-3.0.9
```
##### Run pulled image
```
mkdir -p $HOME/mongodb/data/db

docker run --rm -h mongodb --name MongoDB \
-p 27017:27017 -p 28017:28017 \
-e AUTH=no \
-v $HOME/mongodb/data/db:/data/db \
izone/arm:mongo-3.0.9
```
##### Testing
```
curl -L https://raw.githubusercontent.com/luvres/arm/master/mongo/clientes.json -o 
$HOME/mongodb/data/db/clientes.json

docker exec -ti MongoDB bash
mongoimport --stopOnError --db loja --collection clientes < "/data/db/clientes.json"

mongo loja
show collections
db.clientes.count()
db.clientes.find ( {}, { "nome" : 1 } )
```
##### Buildin
```
docker build -t izone/arm:mongo-3.0.9 ./mongo/3.0.9/
```
##### References
##### http://andyfelong.com/2016/01/mongodb-3-0-9-binaries-for-raspberry-pi-2-jessie/

-----
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
### Debian
##### Pull images

##### Jessie
```
docker pull izone/arm:jessie
```
##### Jessie-slim
```
docker pull izone/arm:jessie-slim

docker run --rm --name Debian -ti izone/arm:jessie-slim cat /etc/debian_version
```
##### Sid
```
docker pull izone/arm:sid
```
##### Sid-slim
```
docker pull izone/arm:sid-slim

docker run --rm --name Debian -ti izone/arm:sid-slim cat /etc/debian_version
```
##### Wheezy
```
docker pull izone/arm:wheezy
```
##### Wheezy-slim
```
docker pull izone/arm:wheezy-slim

docker run --rm --name Debian -ti izone/arm:wheezy-slim cat /etc/debian_version
```
##### list of files/directories which will be removed for the "slim" image variants.
```
tar Jxf rootfs.tar.xz
rm usr/share/doc/* usr/share/locale/* usr/share/man/* usr/share/info/* rootfs.tar.xz -fR
tar Jcf rootfs.tar.xz *
```

-----
### Ubuntu
##### Pull images

##### Xenial
```
docker pull izone/arm:xenial

docker run --rm --name Ubuntu -ti izone/arm:xenial cat /etc/issue
```
##### Trusty
```
docker pull izone/arm:trusty

docker run --rm --name Ubuntu -ti izone/arm:trusty cat /etc/issue
```
##### Precise
```
docker pull izone/arm:precise

docker run --rm --name Ubuntu -ti izone/arm:precise cat /etc/issue
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:xenial ./ubuntu/xenial/
docker build -t izone/arm:trusty ./ubuntu/trusty/
docker build -t izone/arm:precise ./ubuntu/precise/
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

### Arch Linux
##### Pull image
```
docker pull izone/arm:archlinux
```
##### Run pulled image
```
docker run --rm --name ArchLinux -h archlinux -ti izone/arm:archlinux bash
```
##### Procedure for Arch Linux build
```
sudo pacman -S pkgfile
sudo pkgfile --update
sudo pkgfile pacstrap
sudo pacman -S extra/arch-install-scripts
sudo pacman -S expect
sudo pacman -S archlinuxarm-keyring
sudo pacman-key --init
sudo pacman-key --populate archlinuxarm

git clone https://github.com/docker/docker.git
cd docker/contrib
sed -i 's/armv${version}h\/archlinux/izone\/arm:archlinux/' mkimage-arch.sh
sudo ./mkimage-arch.sh 
```

----------
### AUTO CONSTRUCTION creation sequences
#### Base (Alpine)
```
docker build -t izone/arm .
```
#### Base (Debian)
```
docker build -t izone/arm:jessie ./debian/jessie/
docker build -t izone/arm:jessie-slim ./debian/jessie-slim/
docker build -t izone/arm:sid ./debian/sid/
docker build -t izone/arm:sid-slim ./debian/sid-slim/
docker build -t izone/arm:wheezy ./debian/wheezy/
```
#### Base (Ubuntu)
```
docker build -t izone/arm:xenial ./ubuntu/xenial/ && \
docker build -t izone/arm:trusty ./ubuntu/trusty/ && \
docker build -t izone/arm:precise ./ubuntu/precise/
```

#### Databases
##### MariaDB 10.1
```
docker build -t izone/arm:mariadb ./mariadb/ && \
docekr build -t izone/arm:phpmyadmin ./phpmyadmin/
```
##### Postgres latest (9.6.1)
```
docker build -t izone/arm:postgres ./postgres/ && \
docker build -t izone/arm:postgres-9.6 ./postgres/ && \
docker build -t izone/arm:postgres-9.6.1 ./postgres/
```
##### Postgres 9.5
```
docker build -t izone/arm:postgres-9.5 ./postgres/9.5.5/ && \
docker build -t izone/arm:postgres-9.5.5 ./postgres/9.5.5/
```
##### Postgres 9.4
```
docker build -t izone/arm:postgres-9.4 ./postgres/9.4.10/ && \
docker build -t izone/arm:postgres-9.4.10 ./postgres/9.4.10/
```
##### Postgres 9.3
```
docker build -t izone/arm:postgres-9.3 ./postgres/9.3.15/ && \
docker build -t izone/arm:postgres-9.3.15 ./postgres/9.3.15/
```
##### Postgres 9.2
```
docker build -t izone/arm:postgres-9.2 ./postgres/9.2.19/ && \
docker build -t izone/arm:postgres-9.2.19 ./postgres/9.2.19/
```

##### PgAdmin
```
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

### Nodejs
##### Node 7.4.0 (Latest)
```
docker build -t izone/arm:node ./node/7.4/ && \
docker build -t izone/arm:node-7 ./node/7.4/
docker build -t izone/arm:node-7.4 ./node/7.4/
```
##### Node 6.9.5
```
docker build -t izone/arm:node-6 ./node/6.9/ && \
docker build -t izone/arm:node-6.9 ./node/6.9/ && \
docker build -t izone/arm:node-6.9.5 ./node/6.9/
```
##### Node 4.7.3
```
docker build -t izone/arm:node-4 ./node/4.7/ && \
docker build -t izone/arm:node-4.7 ./node/4.7/ && \
docker build -t izone/arm:node-4.7.3 ./node/4.7/
```
### MongoDB
```
docker build -t izone/arm:mongo-3.0.9 ./mongo/3.0.9/
```
