### Debian wheezy
-----
##### Pull image
```
docker pull izone/arm:wheezy
```
##### Run pulled image
```
docker run --rm --name Debian -ti izone/arm:wheezy cat /etc/debian_version
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:wheezy ./jessie/
```
-----
##### Procedure used for debian images
```
git clone https://github.com/docker/docker.git
cd docker/contrib

sudo ./mkimage.sh -d . debootstrap --variant=minbase --components=main 
--include=inetutils-ping,iproute wheezy http://httpredir.debian.org/debian

docker build -t izone/arm:wheezy .
```
##### References for building docker images for ARM architecture
##### https://github.com/docker/docker
##### https://hub.docker.com/r/armv7/armhf-debian/
##### https://github.com/tianon/docker-brew-debian
