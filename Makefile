subtree_pull:
	git subtree pull --prefix=mysql git@github.com:eddiezzz/mysql.git master
	git subtree pull --prefix=ansible git@github.com:eddiezzz/ansible.git master

subtree_push:
	git subtree push --prefix=mysql git@github.com:eddiezzz/mysql.git master
	git subtree push --prefix=ansible git@github.com:eddiezzz/ansible.git master

start_all:
	cd consul && sh run.sh && cd ..
	cd mysql && sh run.sh && cd ..
	cd nginx && sh run.sh && cd ..

stop_all:
	cd consul && sh stop.sh;  cd .. 
	cd mysql && sh stop.sh; cd ..
	cd nginx && sh stop.sh;  cd ..
	
