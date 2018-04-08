FROM scratch
LABEL maintainer=Ulrich
ADD openSUSE-Leap-42.3.base.x86_64.tar.xz /
RUN zypper --non-interactive ref
RUN zypper --non-interactive up
RUN zypper --non-interactive clean -a

RUN zypper --non-interactive install java-1_8_0-openjdk \
 && zypper --non-interactive clean -a
