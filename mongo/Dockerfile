FROM arm32v7/debian:jessie-slim
MAINTAINER Leonardo Loures <luvres@hotmail.com>
COPY qemu-arm-static /usr/bin/qemu-arm-static

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		mongodb-server \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /data/db

EXPOSE 27017
CMD ["mongod"]
