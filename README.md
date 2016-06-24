# Nginx-VH.
Auto Creator Bash Script for Nginx. 

KB.

$ `./inginx.sh` - This Will Install Nginx And Php Packages.

$ `./vh.sh mydomain.com` - This File Will Create Domain Config And Directory.

How To Use.

1. Copy Repo.

   $ `apt-get install git -y`

   $ `git clone https://github.com/hitechlinux/Nginx-vh.git`
   
   $ `cd Nginx-vh/`
   
   $ `chmod +x *`

2. Install Nginx.

   $ `./inginx.sh`
   
3. Host Your First Domain With Nginx.
   
   $ `./vh.sh mydomain.com`

After This. you can find your domain file into  **/etc/nginx/sites-available/**

Find Where Is Your domain name open it with **`nano`** and Delete all "`#`" . NOT CONFIGS ONLY "`#`"

Open a terminal and write **`nginx -t`** if all is ok. **`service nginx reload`**
