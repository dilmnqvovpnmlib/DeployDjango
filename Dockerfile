FROM python:3.6.5

MAINTAINER dilmnqvovpnmlib <simplelpmis6@gmail.com>

ENV PYTHONBUFFERED 1

ENV TZ Asia/Tokyo

# install apache
RUN apt-get update
RUN apt-get install apache2 apache2-dev -y
RUN apt-get install tree -y && apt-get install -y vim

RUN mkdir /app
WORKDIR /app
ADD requirements.txt .
RUN pip install -r requirements.txt
RUN pip install mod_wsgi

ADD conf/mysite.conf /etc/apache2/mods-enabled/

ADD mysite ./mysite

ADD docker-entrypoint.sh .

EXPOSE 80

CMD ["bash", "docker-entrypoint.sh"]
