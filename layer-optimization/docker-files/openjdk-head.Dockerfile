FROM scratch
LABEL maintainer=Ulrich

ADD openSUSE-42.3.tar.xz /

RUN zypper --non-interactive refresh \
 && zypper --non-interactive update  \
 && zypper --non-interactive clean -a

RUN zypper --non-interactive install java-1_8_0-openjdk-headless \
 && zypper --non-interactive clean -a
