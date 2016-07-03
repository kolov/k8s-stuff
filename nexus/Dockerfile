FROM sonatype/nexus3

USER root
COPY run-nexus.sh /opt/sonatype/nexus/run-nexus.sh
RUN chmod +x /opt/sonatype/nexus/run-nexus.sh
CMD /opt/sonatype/nexus/run-nexus.sh