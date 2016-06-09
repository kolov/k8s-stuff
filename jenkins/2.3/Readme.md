# Jenkins image

This dockefile builds an image with some pre-installed plugins. To run:

docker run -p 8085:8080 -v /var/docker/jenkins/2.3:/var/jenkins_home kolov/jenkins:2.3


See more at https://hub.docker.com/_/jenkins/