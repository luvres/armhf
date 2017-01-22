FROM scratch
MAINTAINER Leonardo Loures <luvres@hotmail.com>
LABEL architecture="ARMv7"

ADD rootfs.tar.xz /
CMD ["/bin/sh"]
