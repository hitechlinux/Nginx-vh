#!/bin/bash
# ******************************************
# Script : Nginx AutoInstall/Creator.
# Dev: RAW A.K.A Jasht'sSerie
# ******************************************
# 

#Update System.
apt-get update -y
apt-get upgrade -y

#Stoping Apache.
service apache2 stop
update-rc.d -f apache2 remove

#Starting With Nginx.
apt-get install nginx -y
apt-get install php5-fpm -y
apt-get install -y php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
service nginx start
mkdir /home/vh/


perl -i -pe 's/.*/	keepalive_timeout 2;/ if $.==19' /etc/nginx/nginx.conf
perl -i -pe 's/.*/	server_names_hash_bucket_size 64999;/ if $.==23' /etc/nginx/nginx.conf

rm -Rf /etc/nginx/sites-available/default
cat <<EOF > /etc/nginx/sites-available/default
server {
	listen 80 default_server;
	listen [::]:80 default_server ipv6only=on;

	root /usr/share/nginx/html;
	index index.php index.html index.htm;
	server_name localhost;

	location / {
		try_files $uri $uri/ =404;
	}

	location ~ \.php$ {
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
		fastcgi_pass 127.0.0.1:9000;
		fastcgi_index index.php;
		include fastcgi_params;
	}
}
EOF
perl -i -pe 's/.*/cgi.fix_pathinfo=0/ if $.==768' /etc/php5/fpm/php.ini
perl -i -pe 's/.*/listen = 127.0.0.1:9000/ if $.==33' /etc/php5/fpm/pool.d/www.conf
service php5-fpm reload
service nginx restart
echo "*****************************************************************"
nginx -t

echo "*****************************************************************"
echo "Nginx Instalation Is Done."
echo "Nginx Default html file is /usr/share/nginx/html/index.html"
echo "Host Your First Domain With Command ./vh.sh yourdomain.com"
echo "*****************************************************************"
