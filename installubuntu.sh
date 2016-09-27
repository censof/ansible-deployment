#!/bin/bash

#install sudo sshpass and curl
# apt-get install -y sudo sshpass curl
apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install -y sudo sshpass curl

#ssh-rsa
# echo -e 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDXN7FamXjkhM5BUDhkJ6pyxetos1b/MJ7J6KwI49Reh72LNfiXcW/SU2bF6zTAorDOIiqbW+dsI7PNtc5MxNCCvDoarCcn15p6KFWYSvC6r3krNKdqSKcRvQXKXvWRWWkYzCZVFqHoTDJTGThFzfFUBNEpBU84sMovuU5HVAmbrED3d/nfXumc8c370ubgzDGZkWPNCe+W5RQua6p50GQ2fvCMlEexc/hzGVyP3CjY8ADQQzy+K5BrxYUyINV8vbFDo0dW+ThIbzDQEvRqdo5nge74nKY5WJDhXu3pZDFXS3dnd4B0Heiz2O1j582Z55TjS3/njhwGvcFlvIABfloJ juliana@juliana-Latitude-E5510' >> ~/.ssh/id_rsa.pub

#copy something
# cp /root/django_deployment/id_travis ~/.ssh/id_rsa

#whatever
# chmod 400 ~/.ssh/id_rsa
/opt/miniconda2/bin/conda install --yes -c kbroughton ansible

#installl freetype fontconfig
apt-get install -y freetype fontconfig

curl -O curl -O https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/phantomjs/phantomjs-1.9.2-linux-x86_64.tar.bz2

tar xvf phantomjs-1.9.2-linux-x86_64.tar.bz2
cp phantomjs-1.9.2-linux-x86_64/bin/phantomjs /usr/local/bin


