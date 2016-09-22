#!/bin/bash

#install sudo sshpass and curl
# apt-get install -y sudo sshpass curl
apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install -y sudo sshpass curl

#ssh-rsa
 echo -e 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDF1XPR2tXoWMpywpenL6EyOn9tpGveZegVXZS7QUfUwsYowc+JdHDJv/k4sjaHzPNpFEm9SHI3nPLUcQ5cs+/uEh75AqMocqi/ov87o8+vDhLEcpmoWfA+W4HZ6KS1vzjxGw9XIw7ZvwCuPIXHorJZZCsFzanzl71Z+OHrvvU1fxVlp0bwEV42gAn5CtM7S33ZCuk2YuG5wQwrjcsdwE6a0ATgG84buXL11Vj1XRrZ+ybj679GOd/uhUJImrXFapHeob/arsCiQnPGCwCvVohd2anm1DdAm/SPQjUJFt81VAOKG2kBw8hfJgg9p1l3ZvFS0EP6v8wyAuU9Tje6xRrD lowks@lowkster-laptop' >> ~/.ssh/id_rsa.pub

#copy something
cp /root/django_deployment/id_travis ~/.ssh/id_rsa

#whatever
chmod 400 ~/.ssh/id_rsa
/opt/miniconda2/bin/conda install --yes -c kbroughton ansible

#installl freetype fontconfig
apt-get install -y freetype fontconfig

curl -O curl -O https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/phantomjs/phantomjs-1.9.2-linux-x86_64.tar.bz2

tar xvf phantomjs-1.9.2-linux-x86_64.tar.bz2
cp phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin


