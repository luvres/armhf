## ARMv7 - Build in RaspberryPi 2

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
docker build -t izone/arm:debian ./debian/
```

### Alpine Linux
##### Pull image
```
docker pull izone/arm:alpine
```
##### Run pulled image
```
docker run --rm --name Alpine -ti izone/arm:alpine ash
```
##### Buildin
```
docker build -t izone/arm:alpine ./alpine/
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
docker build -t izone/arm:openjdk ./openjdk/
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
docker build -t izone/arm:php71 ./php71/
```
