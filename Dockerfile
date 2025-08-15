FROM jenkins/jenkins:latest

USER root

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Dhudson.security.csrf.GlobalCrumbIssuerConfiguration.DISABLE_CSRF_PROTECTION=true"
ENV JENKINS_HOME=/var/jenkins_home
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml


COPY plugins.txt /var/jenkins_home/plugins.txt

RUN jenkins-plugin-cli --plugin-file /var/jenkins_home/plugins.txt


USER jenkins