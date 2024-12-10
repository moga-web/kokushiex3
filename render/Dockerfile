FROM ruby:3.3.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV RAILS_ENV=staging
RUN bundle install
COPY . /app

CMD ["rails", "server", "-b", "0.0.0.0", "-p", "${PORT}"]