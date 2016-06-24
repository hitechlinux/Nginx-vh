apt-get update -y
apt-get upgrade -y

#Stoping Apache.
service apache2 stop
update-rc.d -f apache2 remove

#Starting With Nginx.
apt-get install nginx -y
service nginx start
service nginx restart
apt-get install php5-fpm
