### Debian jessie
##### Pull image
```
docker pull izone/arm:jessie
```
##### Run pulled image
```
docker run --rm --name Debian -ti izone/arm:debian bash
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

sudo ./mkimage.sh -d . debootstrap --variant=minbase --components=main 
--include=inetutils-ping,iproute2  jessie http://httpredir.debian.org/debian

docker build -t izone/arm:jessie .
```
##### References for building docker images for ARM architecture
##### https://github.com/docker/docker
##### https://hub.docker.com/r/armv7/armhf-debian/