FROM centos:7
RUN yum install httpd -y
RUN yum clean all
ADD https://raw.githubusercontent.com/devopsgittesting/jenkins-git-docker-slave-pipeline/main/index.html /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
