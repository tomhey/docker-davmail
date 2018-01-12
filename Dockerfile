FROM openjdk:8-jre-alpine

LABEL description="Docker container running DavMail server for use as a local Exchange Gateway"
LABEL version="4.8.1"

ENV DAVMAIL_TARBALL https://downloads.sourceforge.net/project/davmail/davmail/4.8.1/davmail-linux-x86_64-4.8.1-2507.tgz

RUN apk --update --no-cache add tar wget

RUN mkdir -p /usr/local/davmail \
 && wget -qO - $DAVMAIL_TARBALL | tar -C /usr/local/davmail --strip-components=1 -xz

RUN adduser davmail -D \
 && mkdir -p \
     /var/log/davmail \
 && chown davmail:davmail -R \
     /var/log/davmail \
     /usr/local/davmail

RUN apk del tar wget

COPY davmail.properties /etc/davmail/davmail.properties

USER davmail

WORKDIR /usr/local/davmail
CMD ["/usr/local/davmail/davmail.sh", "/etc/davmail/davmail.properties"]

EXPOSE        1080
EXPOSE        1143
EXPOSE        1389
EXPOSE        1110
EXPOSE        1025
