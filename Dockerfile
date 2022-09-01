FROM jenkins/jenkins:lts
USER root
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4
RUN echo "deb http://repo.yandex.ru/clickhouse/deb/stable/ main/" | tee /etc/apt/sources.list.d/clickhouse.list
RUN apt-get update
RUN apt-get --purge autoremove python3-pip
RUN apt-get install -y python-pip wget software-properties-common python3-pip clickhouse-client sshpass
RUN DEBIAN_FRONTEND=noninteractive apt-get install libldap2-dev libsasl2-dev slapd ldap-utils tox lcov valgrind -y
RUN ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa
RUN git config --global http.sslVerify false
RUN pip install --upgrade pip
RUN wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.13.4.linux-amd64.tar.gz
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
RUN echo 'export PATH=$PATH:/usr/local/go/bin' >> /root/.profile
