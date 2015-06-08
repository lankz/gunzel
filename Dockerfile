FROM ruby:2.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /var/www
WORKDIR /var/www

ADD Gemfile /var/www/Gemfile
ADD Gemfile.lock /var/www/Gemfile.lock
RUN bundle install

ADD . /var/www
