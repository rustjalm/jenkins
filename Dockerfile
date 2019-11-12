FROM jenkins/jenkins:lts
USER root
RUN apt-get update
RUN apt-get install -y python-pip
# Install app dependencies
RUN git config --global http.sslVerify false
RUN pip install --upgrade pip
