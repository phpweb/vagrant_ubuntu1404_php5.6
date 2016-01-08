ln -sfn /vagrant/vhosts/* /etc/apache2/sites-enabled/
source /etc/apache2/envvars
sudo service apache2 restart