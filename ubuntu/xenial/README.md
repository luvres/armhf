### Ubuntu Xenial 16.04.1
-----
##### Pull image
```
docker pull izone/arm:xenial
```
##### Run pulled image
```
docker run --rm --name Ubuntu -ti izone/arm:xenial cat /etc/issue
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:xenial ./ubuntu/xenial/
```
