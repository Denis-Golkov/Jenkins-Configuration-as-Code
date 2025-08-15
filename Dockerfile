FROM jenkins/jenkins:latest

USER root

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true"
ENV JENKINS_HOME=/var/jenkins_home
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

COPY casc.yaml /var/jenkins_home/casc.yaml
COPY init.groovy /var/jenkins_home/init.groovy
COPY plugins.txt /var/jenkins_home/plugins.txt

RUN jenkins-plugin-cli --plugin-file /var/jenkins_home/plugins.txt

RUN mkdir -p /var/jenkins_home && \
    chown -R 1000:1000 /var/jenkins_home && \
    chmod -R 755 /var/jenkins_home

COPY config.xml /var/jenkins_home/jobs/Demo/config.xml

USER jenkins