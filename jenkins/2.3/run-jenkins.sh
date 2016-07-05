#!/usr/bin/env bash
chown -R jenkins:jenkins /var/jenkins_home
su jenkins -s /bin/bash nexus -c '/bin/tini -- /usr/local/bin/jenkins.sh'
