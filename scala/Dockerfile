FROM  openjdk:8u131-jdk

RUN addgroup scala && useradd scala -g scala -s /bin/bash -m


# Install Scala
ENV SCALA_VERSION 2.12.0
RUN mkdir ~/bin
RUN mkdir ~/tmp
RUN curl -SLf http://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz \
  | tar xfz - -C ~/tmp \
  && cp -r ~/tmp/scala-$SCALA_VERSION/. ~/ \
  && rm -rf ~/tmp

# Install sbt
ENV SBT_VERSION 0.13.13
RUN curl -SLf -o ~/bin/sbt-launch.jar https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar
COPY sbt /home/docker/bin/sbt
RUN chown -R scala:scala /home/docker/bin/
# RUN chown -R scala:scala /scala
RUN chmod +x /home/docker/bin/sbt
RUN ls -al /home/docker/bin
RUN ls -al /scala

RUN /home/docker/bin/sbt

ENV PATH=/home/docker/bin:$PATH



