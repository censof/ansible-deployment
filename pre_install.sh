#!/bin/bash

wget http://repo.continuum.io/miniconda/Miniconda3-3.7.0-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
echo 'PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bash_profile
echo 'PATH="$HOME/miniconda/bin:$PATH"' >> ~/.bashrc

source ~/.bash_profile
conda update conda
conda install -c kbroughton ansible
