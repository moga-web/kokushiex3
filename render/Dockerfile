FROM ruby:3.3.6

ENV APP_ROOT /app
ENV RAILS_ENV=staging

RUN mkdir /app
WORKDIR /app

COPY render/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs \
    && bundle config set --local without 'development test' \
    && bundle install

COPY . /app

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]