FROM scratch
MAINTAINER Leonardo Loures <luvres@hotmail.com>
#LABEL architecture="ARMv7"

# Mini Root Filesystem
# https://fr.alpinelinux.org/alpine/
ADD alpine-minirootfs-3.5.1-armhf.tar.gz /

CMD ["/bin/sh"]
