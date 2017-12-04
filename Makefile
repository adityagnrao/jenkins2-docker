.PHONY: clean keygen build run

clean:
		rm ssh_keys/*

keygen:
		ssh-keygen -t rsa -b 4096 -C "deployer@mapr.com" -f ssh_keys/deployer

build:
		docker build . -t adityagnrao/jenkins2-docker:v6.0.0-stress --cache-from adityagnrao/jenkins2-docker:v6.0.0-stress
		mkdir -p `pwd`/jenkins_home/
		chmod -R 777 `pwd`/jenkins_home/
		chmod -R 400 `pwd`/jenkins_home/.ssh/config
		chmod -R 600 `pwd`/jenkins_home/.ssh/id_rsa

run:
	 	docker run -d --privileged -p 1990:1990 -p 49000:49000 -v `pwd`/jenkins_home/:/var/jenkins_home \
		adityagnrao/jenkins2-docker:v6.0.0-stress 2>&1
up-plug:
		./update-plugins.sh	
