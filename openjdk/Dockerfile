FROM izone/arm
MAINTAINER Leonardo Loures <luvres@hotmail.com>

# Default to UTF-8 file.encoding
ENV LANG=C.UTF-8 \
    JAVA_VERSION_MINOR=8 \
    JAVA_VERSION=1.8
ENV JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk \
    PATH=$PATH:/usr/lib/jvm/java-${JAVA_VERSION}-openjdk/jre/bin:/usr/lib/jvm/java-${JAVA_VERSION}-openjdk/bin

# add a simple script that can auto-detect the appropriate JAVA_HOME value
# based on whether the JDK or only the JRE is installed
RUN { \
		echo '#!/bin/sh'; \
		echo 'set -e'; \
		echo; \
		echo 'dirname "$(dirname "$(readlink -f "$(which javac || which java)")")"'; \
	} > /usr/local/bin/docker-java-home \
	&& chmod +x /usr/local/bin/docker-java-home \
    \
    && apk add --no-cache openjdk${JAVA_VERSION_MINOR}-jre-base
