#!/bin/bash
db_username=${db_username}
db_user_password=${db_user_password}
db_name=${db_name}
db_RDS=${db_RDS}
sudo su
sudo yum update -y
sudo yum install httpd -y 
amazon-linux-extras install php7.3 -y
sudo yum update -y
sudo wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
sudo yum localinstall mysql57-community-release-el7-11.noarch.rpm -y
rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
yum install mysql-community-server -y
systemctl start mysqld.service
systemctl start httpd
systemctl enable httpd --now
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$db_name/g" wp-config.php
sed -i "s/username_here/$db_username/g" wp-config.php
sed -i "s/password_here/$db_user_password/g" wp-config.php
sed -i "s/localhost/$db_RDS/g" wp-config.php
sed -i "s|define('WP_SITEURL', 'http://$(curl http://169.254.169.254/latest/meta-data/public-ipv4)');|g" wp-config.php
sed -i "s|define('WP_HOME', 'http://$(curl http://169.254.169.254/latest/meta-data/public-ipv4)');|g" wp-config.php
sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp 
export PATH=$PATH:/usr/local/bin
source ~/.bashrc
wp --info
wp core install --url=$(curl http://169.254.169.254/latest/meta-data/public-ipv4) --title=HELLO-WORLD --admin_user=rameez --admin_password=rameez --admin_email=xyzs195@gmail.com
chown -R ec2-user:apache /var/www/html
chmod -R 774 /var/www/html
systemctl enable  httpd.service
systemctl restart httpd.service
cd /var/www/html/
mkdir page 
cd page
touch index.html
echo "Hello World" > index.html


