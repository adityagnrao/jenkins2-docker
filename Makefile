.PHONY: clean keygen build run

clean:
		rm ssh_keys/*

keygen:
		ssh-keygen -t rsa -b 4096 -C "deployer@example.com" -f ssh_keys/deployer

build:
		docker build . -t robmorgan/jenkins2

run:
	 	docker run -ti -p 1990:1990 -p 49000:49000 robmorgan/jenkins2
