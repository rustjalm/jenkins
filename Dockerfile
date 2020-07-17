FROM jenkins/jenkins:lts
USER root
RUN apt-get update
RUN apt-get install -y python-pip wget software-properties-common
# Install app dependencies
RUN git config --global http.sslVerify false
RUN pip install --upgrade pip
RUN wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /root/.profile
