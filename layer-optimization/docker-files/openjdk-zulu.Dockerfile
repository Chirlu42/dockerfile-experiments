FROM scratch
LABEL maintainer=Ulrich

ADD openSUSE-42.3.tar.xz /

RUN zypper --non-interactive refresh \
 && zypper --non-interactive update  \
 && zypper --non-interactive clean -a

COPY zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz /tmp

ENV JDK_VERSION=1.8.0_163
ENV JAVA_HOME=/usr/lib/jvm/zulu-8-amd64
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

RUN zypper install -y tar \
 && cd /tmp \
 && tar -xvzf /tmp/zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz \
 && mkdir -p /usr/lib/jvm \
 && mv /tmp/zulu8.28.0.1-jdk8.0.163-linux_x64 /usr/lib/jvm/zulu-8-amd64 \
 && rm -f /tmp/zulu8.28.0.1-jdk8.0.163-linux_x64.tar.gz \
 && zypper remove -y tar \
 && zypper clean -a
 