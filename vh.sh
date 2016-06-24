#!/bin/bash
# ******************************************
# Script : Nginx AutoInstall/Creator.
# Dev: RAW A.K.A Jasht'sSerie
# ******************************************

if [ "$1" ]
then
mkdir -p /home/vh/$1/public_html


cat <<EOF > /etc/nginx/sites-available/$1
server {
	listen 80;
        listen [::]:80;

	root /home/vh/$1/public_html;
	index index.php index.html index.htm;
	server_name $1 www.$1;

	location ~ \.php$ {
        try_files $uri =404;
		fastcgi_split_path_info ^(.+\.php)(/.+)$;
		fastcgi_pass 127.0.0.1:9000;
		fastcgi_index index.php;
		include fastcgi_params;
	}
}
EOF

cat <<EOF > /home/vh/$1/public_html/index.html
<html>
<h1><center>Default Welcome</h1></center>
<h2><center>Login at your server and upload files in /home/vh/$1/public_html/</h2></center>
</html>
EOF

sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo service nginx reload
else
    echo "Please Write A Domain Name EX. ./vh.sh mydomain.com"
fi
echo "**********************************************************"
echo " You Can Upload Your Files Into /home/vh/$1/public_html "
echo "**********************************************************"
