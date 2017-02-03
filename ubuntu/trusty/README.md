### Ubuntu Trusty 14.04.5
-----
##### Pull image
```
docker pull izone/arm:trusty
```
##### Run pulled image
```
docker run --rm --name Ubuntu -ti izone/arm:trusty cat /etc/issue
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:trusty ./ubuntu/trusty/
```
