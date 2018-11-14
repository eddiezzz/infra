rm -f /opt/logs/nginx/*
docker run -p 80:80 -p 443:443 -v /root/techwood/nginx/etc/nginx:/etc/nginx -v /.well-known:/usr/share/nginx/html/.well-known -v /opt/logs/nginx:/var/log/nginx/ -v /etc/letsencrypt/:/etc/letsencrypt/ -v /etc/localtime:/etc/localtime -d nginx:latest 
