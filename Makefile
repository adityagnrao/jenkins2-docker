.PHONY: clean keygen build run

clean:
		rm ssh_keys/*

keygen:
		ssh-keygen -t rsa -b 4096 -C "deployer@mapr.com" -f ssh_keys/deployer

build:
		docker build . -t `git rev-parse HEAD`/jenkins2 --cache-from `git rev-parse HEAD`/jenkins2:latest

run:
	 	docker run -d -p 1990:1990 -p 49000:49000 -v `pwd`/jenkins_home/jobs/:/var/jenkins_home/jobs `git rev-parse HEAD`/jenkins2 2>&1
