#!/bin/bash
#Author ：a34546@163.com
#Description: 一键部署NginxOnDocker Demo

mkdir -p /home/docker/nginx/log
mkdir -p /home/docker/nginx/conf.d
mkdir -p /home/docker/nginx/html
wget -P /home/docker/nginx https://a34546.github.io/nginx-on-docker/nginx.conf
wget -P /home/docker/nginx/conf.d https://a34546.github.io/nginx-on-docker/default.conf
wget -P /home/docker/nginx/html https://a34546.github.io/nginx-on-docker/index.html

docker run --name docker_nginx -d -p 80:80 \
-v /home/docker/nginx/log:/var/log/nginx \
-v /home/docker/nginx/nginx.conf:/etc/nginx/nginx.conf \
-v /home/docker/nginx/conf.d:/etc/nginx/conf.d \
-v /home/docker/nginx/html:/usr/share/nginx/html nginx
echo "------------脚本执行完成--------------"
exit 0