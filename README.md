# server-utils :rocket:

## Limitations 
Note this is only for debian 10

## Usage 
This repo is a list of helpful scripts to setup a server faster 

## server-setup 
This script installs the following tools
* Git
* Docker
* docker-compose 

### How to use Server-Setup? :raising_hand:
* clone this repo 
* chmod u+x server-setup.sh
* sudo ./server-setup.sh

### Nginx Config
```
server {
    listen 0.0.0.0:80;
    server_name <CHANGEME.COM>;
    access_log /var/log/nginx/*your-domain-name*.log;

    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header HOST $http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass http://127.0.0.1:2368;
        proxy_redirect off;
    }
}
```

### Restart Nginx 
```
sudo systemctl reload nginx

```

### SSL Certbot 
```
sudo certbot --nginx -d <CHANGEME.COM>
```

