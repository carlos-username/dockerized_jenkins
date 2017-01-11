FROM jenkins:2.32.1

USER root

RUN apt-get -yqq update && apt-get -yqq install docker.io && usermod -g docker jenkins

COPY gosu-amd64 /usr/local/bin/gosu

RUN chmod 755 /usr/local/bin/gosu

VOLUME ["/var/run/docker.sock","/var/jenkins_home"]

ENTRYPOINT groupmod -g $(stat -c "%g" /var/run/docker.sock) docker && usermod -u $(stat -c "%u" /var/jenkins_home) jenkins && gosu jenkins /bin/tini -- /usr/local/bin/jenkins.sh
