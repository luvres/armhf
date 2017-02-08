FROM scratch
MAINTAINER Leonardo Loures <luvres@hotmail.com>
#LABEL architecture="ARMv7"

# Mini Root Filesystem
# https://nl.alpinelinux.org/alpine/v3.5/releases/armhf/
ADD alpine-minirootfs-3.5.1-armhf.tar.gz /

CMD ["/bin/sh"]
