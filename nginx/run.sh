cur=$(pwd)
docker stop nginx
docker rm nginx
rm -f /opt/logs/nginx/*

with_time="-v /etc/localtime:/etc/localtime:ro"
wth_key="-v /etc/letsencrypt/"
os=$(uname)
if [ "-$os" = "-Darwin" ]; then
    with_time=""
    with_key="-v $cur/letsencrypt/"
fi

docker run --name nginx -p 80:80 -p 443:443 -v $cur/etc/nginx:/etc/nginx -v /opt/logs/nginx:/var/log/nginx/ -v /etc/letsencrypt/:/etc/letsencrypt/ $with_time $with_key -d nginx:latest 
