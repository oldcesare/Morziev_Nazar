FROM jenkins/jenkins:lts

USER root
RUN apt update && apt install -y docker.io rpm dpkg sudo
RUN usermod -aG docker jenkins

USER jenkins

COPY . /usr/src/jenkins
WORKDIR /usr/src/jenkins

