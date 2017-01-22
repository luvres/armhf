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
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:tomcat ./tomcat/
```

### Postgres 9.5.5
##### Pull image
```
docker pull izone/arm:postgres
```

##### Run pulled image
```
docker run --name Postgre -h postgres \
-p 5432:5432 \
-e POSTGRES_PASSWORD=postgres \
-d izone/arm:postgres

```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:postgres ./postgres/
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

