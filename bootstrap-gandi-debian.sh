apt-get -y update
apt-get -y upgrade
apt-get -y install curl

curl -L http://bootstrap.saltstack.org | sh -s -- git develop
pip uninstall -y salt
pip install salt

cd /root
rm -Rf gitsalt
git clone https://github.com/b4stien/vagdebwheezy.git gitsalt

rm -f /srv/salt
ln -s /root/gitsalt/salt/root/ /srv/salt

mv /etc/salt/minion /etc/salt/minion.old
cp /root/gitsalt/salt/gandi_debian_minon_config /etc/salt/minion

apt-get install sudo
adduser admin sudo

salt-call state.highstate
