
# location of informix install
export INFORMIXDIR=/opt/informix

# add $INFORMIXDIR/bin to PATH for easy execution of Informix commands
export PATH=${INFORMIXDIR}/bin:${PATH}

# I still like to set this env variable even tho we used the default location
export INFORMIXSQLHOSTS=${INFORMIXDIR}/etc/sqlhosts

# the name of our Informix instance, matches sqlhosts and DBSERVERNAME in ONCONFIG
#export INFORMIXSERVER=blogsvr01

# define the config filename
export ONCONFIG=onconfig.${INFORMIXSERVER}
