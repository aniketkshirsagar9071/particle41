FROM centos:latest
MAINTAINER aniketkshirsagar9071@gmail.com
RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN  dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm
RUN  dnf module list php -y
RUN  dnf module enable php:remi-8.0 -y
RUN  dnf install -y  php && dnf install -y  php-cli && dnf install -y  php-common && dnf install -y nginx && dnf install -y sudo
RUN mkdir /run/php-fpm
ADD  ./index.php /usr/share/nginx/html/
COPY ./entrypoint.sh /tmp/entrypoint.sh
ENTRYPOINT ["/tmp/entrypoint.sh"]
ARG user=aniket
ARG group=aniket
ARG uid=1000
ARG gid=1000
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/bash -m ${user} # <--- the '-m' create a user home directory
RUN echo "${user} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${user} \ && chmod 0440 /etc/sudoers.d/${user}
USER ${uid}:${gid}
