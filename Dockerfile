FROM ruby:2.4

RUN apt-get -y update && \
		apt-get -y install nodejs mysql-client && \
		gem install bundler && \
		gem install procodile

COPY postal /opt/postal
WORKDIR /opt/postal
RUN useradd -r -d /opt/postal -s /bin/bash postal && chown -R postal:postal .
RUN ./bin/postal bundle vendor/bundle

COPY wrapper.sh wrapper.sh

EXPOSE 5000
