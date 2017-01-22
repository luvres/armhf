## ARMv7 - Build in RaspberryPi 2

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

### Openjdk 8 with Debian base
##### Pull image
```
docker pull izone/arm:openjdk
```
##### Run pulled image
```
docker run --rm --name Debian -ti izone/arm:openjdk java -version
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:openjdk ./openjdk/
```

### Openjdk 8 with Alpine
##### Pull image
```
docker pull izone/arm:openjdk-alpine
```
##### Run pulled image
```
docker run --rm --name Alpine -ti izone/arm:openjdk-alpine java -version
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:openjdk-alpine ./openjdk-alpine/
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

docker build -t izone/arm:php56 ./php56/
```

### PHP 7.1 and Apache
##### Pull image
```
docker pull izone/arm:php71
```
##### Run pulled image
```
mkdir $HOME/www

docker run --rm --name Php -h php -p 80:80 -v $HOME/www:/var/www/html izone/arm:php71
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:php71 ./php71/
```

### Tomcat 8.0.39
##### Pull image
```
docker pull izone/arm:tomcat-alpine
```
##### Run pulled image
```
docker run --rm --name Tomcat -h tomcat \
-e PASS="admin" \
-p 8008:8080 \
-ti izone/arm:tomcat-alpine

docker run -name Tomcat -h tomcat \
-e PASS="admin" \
-p 8008:8080 \
-d izone/arm:tomcat-alpine
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:tomcat-alpine ./tomcat-alpine/
```