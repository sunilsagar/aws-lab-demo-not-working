# This is our first real Docker File
ARG TAGVERSION=6
FROM centos:${TAGVERSION}

LABEL maintainer="sunilsagar31@gmail.com"

RUN yum update -y && \
	yum install -y httpd net-tools -y && \
	mkdir -p /run/httpd && \
	rm -rf /run/httpd/* /tmp/httpd* 

#ADD http://somedomain.com/sometextfile.txt dest

COPY index.html /var/www/html/
COPY image*.jpeg /var/www/html/

ENV ENVIRONMENT="production"

VOLUME /mymount 

EXPOSE 80

ENTRYPOINT httpd "-DFOREGROUND"
