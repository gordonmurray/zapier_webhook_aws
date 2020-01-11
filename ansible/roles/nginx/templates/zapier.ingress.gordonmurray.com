server {
        listen 80;
        root /var/www/html;
        index index.php
        server_name zapier.ingress.gordonmurray.com;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }
}
server {
        root /var/www/html;
        index index.php
        server_name zapier.ingress.gordonmurray.com;

        location / {
                try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        }

        location ~ /\.ht {
                deny all;
        }

    server_name zapier.ingress.gordonmurray.com; # managed by Certbot

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/zapier.ingress.gordonmurray.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/zapier.ingress.gordonmurray.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

    add_header Strict-Transport-Security "max-age=31536000" always; # managed by Certbot
}