# Jenkins 2 Docker

This is the repository for a Jenkins 2 job management,
Add jobs to the jenkins,
commit them and 
get the image ready from docker hub at adityagnrao/jenkins2-docker.

Note: The global Jenkins security has been disabled.

1. Clone the Repo

```
$ git clone https://github.com/adityagnrao/jenkins2-docker
$ cd jenkins2-docker
```

2. Generate GitHub deployment keys (https://developer.github.com/guides/managing-deploy-keys/).

```
$ make keygen
```

Note: Deploy keys are usually not protected by a passphrase, making the key
easily accessible if the server is compromised.

3. Build the Docker image

```
$ make build
```

4. Start Jenkins

```
$ make run
$ open http://localhost:1990
```
