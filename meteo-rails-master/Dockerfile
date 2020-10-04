FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/src/meteo-rails
WORKDIR /usr/src/meteo-rails
ADD Gemfile /usr/src/meteo-rails/Gemfile
ADD Gemfile.lock /usr/src/meteo-rails/Gemfile.lock
RUN bundle install
ADD . /usr/src/meteo-rails
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
