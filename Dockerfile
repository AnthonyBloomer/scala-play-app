FROM ubuntu
ENV NEW_RELIC_APP_NAME="Scala Play"
ENV NEW_RELIC_LICENSE_KEY=${NEW_RELIC_LICENSE_KEY}
ARG SBT_VERSION=1.3.3
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY src/ $APP_HOME
RUN apt-get update && apt-get install openjdk-8-jdk scala gnupg2 curl -y
RUN \
  curl -L -o sbt-$SBT_VERSION.deb https://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt
RUN mkdir newrelic
WORKDIR newrelic
RUN curl https://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic.jar --output newrelic.jar -s
WORKDIR $APP_HOME
CMD ["sbt", "run", "-J-javaagent:newrelic/newrelic.jar"]