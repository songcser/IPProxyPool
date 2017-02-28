FROM ubuntu:14.04.3
MAINTAINER songjiyi2008@163.com
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US:en

RUN rm -f /etc/apt/sources.list
ADD develop/trusty /etc/apt/sources.list.d
RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install -y \
      python-pip \
      python-dev \
      libpq-dev \
      python-lxml \
      libxml2-dev \
      postgresql-client \
      libxslt1-dev \
      libssl-dev \
      libffi-dev


RUN mkdir -p /srv/proxypool
WORKDIR /srv/proxypool

ADD requirements.txt /srv/proxypool/requirements.txt
RUN pip install -i 'https://pypi.mirrors.ustc.edu.cn/simple' -r requirements.txt
