FROM jenkins:2.3

MAINTAINER Assen Kolov <assen.kolov@gmail.com>
#
# Cloned from https://github.com/joostvdg/cow/blob/master/jenkins
#
COPY plugins.txt /usr/share/jenkins/plugins.txt

USER root
RUN apt-get update && apt-get install -y curl iptables

USER jenkins
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state