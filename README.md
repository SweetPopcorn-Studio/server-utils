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
    server_name <CHANGEME.COM>; #CHANGE
    access_log /var/log/nginx/<CHANGEME.COM>.log; #CHANGE

    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header HOST $http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass http://127.0.0.1:7777; #CHANGE
        proxy_redirect off;
    }
    
   location ~ "/assets/images/(.*)-([a-z0-9]{10})\.(?:png|jpe?g|tiff)(.*)$" {
        expires           max;
        add_header        Cache-Control public;
        add_header        Vary Accept;
        proxy_pass        http://127.0.0.1:7777/$uri$webp_suffix; #CHANGE
        access_log        off;
      }

  # Cache Ghost css and js 
  location ~* \.(?:css|js) {
        expires           max;
        add_header        Cache-Control public;
        proxy_pass        http://127.0.0.1:7777/$uri; #CHANGE
        access_log        off;
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

