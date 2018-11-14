cur=$(pwd)

sh -x stop.sh
sh -x clear.sh

os=$(uname)
if [ "-$os" = "-Darwin" ]; then
    docker run --name mysql -d -p 3306:3306 -v $cur/volume/etc/mysql:/etc/mysql -v $cur/volume/data:/var/lib/mysql -v init:/init -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql:5.7.18
else
    docker run --name mysql -d -p 3306:3306 -v $cur/volume/etc/mysql:/etc/mysql -v $cur/volume/data:/var/lib/mysql -v /etc/localtime:/etc/localtime:ro -v init:/init -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql:5.7.18
fi
if [ $? -ne 0 ]; then
	echo "docker run error, check it"
	exit 1
fi

sh wait_for_mysql.sh
if [ $? -ne 0 ]; then
	echo "wait mysql error, check it"
	exit 1
fi

mysql --protocol=tcp -uroot < init/init.sql
