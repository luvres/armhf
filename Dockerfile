FROM scratch
MAINTAINER Leonardo Loures <luvres@hotmail.com>
#LABEL architecture="ARMv7"

# Mini Root Filesystem
# https://fr.alpinelinux.org/alpine/v3.5/releases/armhf/alpine-minirootfs-3.5.0-armhf.tar.gz
ADD alpine-minirootfs-3.5.0-armhf.tar.gz /

CMD ["/bin/sh"]
