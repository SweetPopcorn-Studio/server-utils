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
  server_name CHANGEME.COM
  location / {
    proxy_pass  http://127.0.0.1:7777;
  }
}
```
