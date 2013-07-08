apt-get -y update && apt-get -y upgrade
apt-get -y install curl git sudo

adduser admin sudo

curl -L http://bootstrap.saltstack.org | sh -s -- git develop

cd /root
git clone https://github.com/b4stien/vagdebwheezy.git gitsalt
ln -s /root/gitsalt/salt/root /srv/salt

mv /etc/salt/minion /etc/salt/minion.old
cp gandi_debian_minion_config /etc/salt/minion

salt-call state.highstate --local
