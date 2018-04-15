FROM scratch
LABEL maintainer=Ulrich

ADD openSUSE-42.3.tar.xz /

RUN zypper --non-interactive clean -a && zypper --non-interactive refresh \
 && zypper --non-interactive update  \
 && zypper --non-interactive clean 
