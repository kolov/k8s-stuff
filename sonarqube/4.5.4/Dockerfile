FROM sonarqube:4.5.4

MAINTAINER Assen Kolov <assen.kolov@gmail.com>

ENV SONAR_VERSION=4.5.4 \
    SONARQUBE_HOME=/opt/sonarqube

RUN mkdir -p $SONARQUBE_HOME/extensions/plugins \
    && curl http://central.maven.org/maven2/org/codehaus/sonar-plugins/sonar-pitest-plugin/0.4/sonar-pitest-plugin-0.4.jar \
    -o $SONARQUBE_HOME/extensions/plugins/sonar-pitest-plugin-0.4.jar \
    && curl http://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-2.13.jar \
    -o $SONARQUBE_HOME/extensions/plugins/sonar-javascript-plugin-2.13.jar \
    && curl https://sonarsource.bintray.com/Distribution/sonar-generic-coverage/sonar-generic-coverage-plugin-1.2.jar \
    -o $SONARQUBE_HOME/extensions/plugins/sonar-generic-coverage-plugin-1.2.jar
