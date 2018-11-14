cur=$(pwd)
docker stop nginx
docker rm nginx
rm -f /opt/logs/nginx/*
docker run --name nginx -p 80:80 -p 443:443 -v $cur/etc/nginx:/etc/nginx -v /opt/logs/nginx:/var/log/nginx/ -v /etc/letsencrypt/:/etc/letsencrypt/ -v /etc/localtime:/etc/localtime -d nginx:latest 
