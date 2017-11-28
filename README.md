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

### Steps to commit a newly added jenkins job : 

   1. Let's say the newly created job is "TestJob",

       The jenkins-home directory in docker is volume mounted under jenkins2-docker/jenkins_home.

   2. commit the job's config

      ```
      git commit jenkins_home/jobs/TestJob/config.xml
      ```

      Note :  in case you want this job to be in a new branch,

      a. create a new branch

       ```
       git branch newbranch
       ```

      b. modify the Makefile to have the tag as newbranch in all docker img references

       ```
       Ex: adityagnrao/jenkins2-docker:latest -> adityagnrao/jenkins2-docker:newbranch
       ```

      c. commit both the job's config as well as the modified Makefile

       ```
       git commit jenkins_home/jobs/TestJob/config.xml Makefile
       ```
 
   3. git push 
       
       ```
       git push https://github.com/adityagnrao/jenkins2-docker
       ```
