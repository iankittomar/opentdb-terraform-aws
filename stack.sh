#!/bin/sh
#AWS EC2
#CentOS Linux 7 x86_64 HVM EBS 1704_01 - ami-330fd15c
#On Terminal
#ssh -i anktiCentos.pem centos@18.185.101.99
#On CLI
#Adding latest content and updates
sudo yum --enablerepo=extras install centos-release-scl -y
sudo yum --enablerepo=extras install epel-release -y
sudo yum update -y 
#Installing a code-editor
sudo yum install vim -y 
#Since System has only one main user, we disable SELINUX to make things easier
#run the following command and set SELINUX=permissive
sudo vim /etc/sysconfig/selinux
#Installing Web Server, We will use Openresty : An NGINX powered web server
sudo yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
sudo yum install openresty openresty-resty openresty-opm -y
#Install a database, we choose postgreSQL
sudo yum install https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm -y
sudo yum install postgresql11 postgresql11-server -y
sudo /usr/pgsql-11/bin/postgresql-11-setup initdb 
sudo systemctl enable postgresql-11
#Choosing a backend language, we choose PHP with PHP-FPM + it's postgresql plugin
sudo yum install rh-php71 rh-php71-php-fpm rh-php71-php-pgsql -y 
#Starting All Services
sudo systemctl start openresty rh-php71-php-fpm postgresql-11
sudo chmod a+wrx /usr/local/openresty/nginx/html
sudo cp index.php backend.php /usr/local/openresty/nginx/html
sudo rm -rf /usr/local/openresty/nginx/html/index.html
sudo mv nginx.conf /usr/local/openresty/nginx/conf/
sudo systemctl restart openresty rh-php71-php-fpm postgresql-11