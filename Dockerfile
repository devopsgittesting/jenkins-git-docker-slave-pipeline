FROM centos:7
RUN yum install httpd -y
RUN yum clean all
COPY index.html /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
