FROM scratch
LABEL maintainer=Ulrich

ADD openSUSE-42.3.tar.xz /

RUN zypper --non-interactive refresh \
 && zypper --non-interactive update  \
 && zypper --non-interactive clean -a

RUN zypper --non-interactive install wget \ 
 && wget  http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems -O /tmp/zulu.key \
 && rpmkeys --import /tmp/zulu.key \
 && rm -f /tmp/zulu.key \
 && zypper --non-interactive remove wget \
 && zypper --non-interactive clean -a
 
RUN zypper --non-interactive addrepo http://repos.azulsystems.com/sles/latest zulu \
 && zypper --non-interactive refresh zulu \
 && zypper --non-interactive install zulu-8 \
 && zypper --non-interactive clean -a
 
 