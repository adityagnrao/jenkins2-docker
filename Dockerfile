FROM jenkins/jenkins

# Install build tools
USER root

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install -y curl git-core unzip php-cli curl wget tar vim gawk sudo sshpass && rm -rf /var/lib/apt/lists/* \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers

# copy plugins
COPY plugins.txt /usr/share/jenkins/ref/

# disable security
COPY config.xml  /usr/share/jenkins/ref/config.xml

# import ssh keys and credentials
COPY credentials.xml /usr/share/jenkins/ref/credentials.xml
#COPY ssh-config /usr/share/jenkins/ref/.ssh/config
#COPY ssh_keys/deployer /usr/share/jenkins/ref/.ssh/id_rsa
#COPY ssh_keys/deployer.pub /usr/share/jenkins/ref/.ssh/id_rsa.pub

# import jobs
COPY 1-phinx.xml /usr/share/jenkins/ref/jobs/Phinx/config.xml

# fix permissions
RUN chown -R jenkins:jenkins /usr/share/jenkins/ref

# drop back to jenkins user
USER jenkins

# install plugins
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# disable initial setup wizard
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"

ENV JENKINS_OPTS --httpPort=1990 
EXPOSE 1990
ENV JENKINS_SLAVE_AGENT_PORT 49000
