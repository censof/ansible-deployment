# "ported" by Adam Miller <maxamillion@fedoraproject.org> from
#   https://github.com/fedora-cloud/Fedora-Dockerfiles
#
# Originally written for Fedora-Dockerfiles by
#   scollier <scollier@redhat.com>

FROM hasedon/centos6.5
MAINTAINER The CentOS Project <cloud-ops@centos.org>

RUN yum -y update; yum clean all
# RUN yum -y install epel-release; yum clean all
# RUN yum -y install postgresql-server postgresql postgresql-contrib supervisor openssh-server; yum clean all
RUN yum -y install openssh-server; yum clean all

# ADD ./postgresql-setup /usr/bin/postgresql-setup
# ADD ./postgres_user.sh /postgres_user.sh
# ADD ./supervisord.conf /etc/supervisord.conf
# ADD ./start_postgres.sh /start_postgres.sh

# RUN chmod +x /usr/bin/postgresql-setup
# RUN chmod +x /start_postgres.sh
# RUN chmod +x /postgres_user.sh

# RUN /usr/bin/postgresql-setup initdb

RUN mkdir /var/run/sshd
RUN echo 'root:puerh3' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN /usr/bin/ssh-keygen -t rsa -f /etc/ssh/ssh_host_dsa_key -C '' -N ''

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# ADD ./postgresql.conf /var/lib/pgsql/data/postgresql.conf

# RUN chown -v postgres.postgres /var/lib/pgsql/data/postgresql.conf

# RUN echo "host    all             all             0.0.0.0/0               md5" >> /var/lib/pgsql/data/pg_hba.conf

# RUN /postgres_user.sh

# EXPOSE 5432

# CMD ["/bin/bash", "/start_postgres.sh"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
