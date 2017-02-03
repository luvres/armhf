### Ubuntu Precise 12.04.5
-----
##### Pull image
```
docker pull izone/arm:precise
```
##### Run pulled image
```
docker run --rm --name Ubuntu -ti izone/arm:precise cat /etc/issue
```
##### Buildin
```
git clone https://github.com/luvres/arm.git
cd arm

docker build -t izone/arm:precise ./precise/
```
