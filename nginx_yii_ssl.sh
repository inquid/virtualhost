#!/bin/sh

echo 'server {
    listen 80;
    server_name '$1';
    rewrite ^/(.*) https://'$1'/$1 permanent;
}
server {
    charset utf-8;
    client_max_body_size 128M;
    listen 443 ssl; ## listen for ipv4
    #listen [::]:80 default_server ipv6only=on; ## listen for ipv6
    server_name '$1';
    root        /var/www/html/web;
    index       index.php;
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    server_name '$1';
    ssl_certificate /home/gogl92/.getssl/'$1'/'$1'.crt;
    ssl_certificate_key /home/gogl92/.getssl/'$1'/'$1'.key;

    location / {
        try_files $uri $uri/ /index.php$is_args$args;
    }
    # uncomment to avoid processing of calls to non-existing static files by Yii
    #location ~ \.(js|css|png|jpg|gif|swf|ico|pdf|mov|fla|zip|rar)$ {
    #    try_files $uri =404;
    #}
    #error_page 404 /404.html;
    # deny accessing php files for the /assets directory
    location ~ ^/assets/.*\.php$ {
        deny all;
    }
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    }
}' > /etc/nginx/sites-enabled/default
