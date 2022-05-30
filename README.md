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
* nginx 
* certbot

### How to use Server-Setup? :raising_hand:
* clone this repo 
* chmod u+x server-setup.sh
* sudo ./server-setup.sh

### Nginx Config

```
server {
    listen 0.0.0.0:80;
    server_name <CHANGEME.COM>; #CHANGE
    access_log /var/log/nginx/<CHANGEME.COM>;  #CHANGE

    location / {
        proxy_pass http://127.0.0.1:7777;  #CHANGE
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_buffering off;
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

