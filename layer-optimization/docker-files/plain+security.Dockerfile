FROM scratch
LABEL maintainer=Ulrich

ADD openSUSE-42.3.tar.xz /

RUN zypper --non-interactive refresh \
 && zypper --non-interactive update  \
 && zypper --non-interactive clean -a

ADD get_secret /bin/
ADD update_secret /bin/
ADD delete_secret /bin/
ADD jq /bin/
ADD vault /bin/
ADD CPLauncher /bin/
ADD version.txt /
RUN chmod +x /bin/get_secret /bin/update_secret /bin/delete_secret /bin/jq /bin/vault /bin/CPLauncher 
 
 