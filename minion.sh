curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh
echo "master: salt" > /etc/salt/minion
service salt-minion start