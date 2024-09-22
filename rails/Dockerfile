FROM ruby:3.2.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  postgresql-client \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install bundler

COPY . /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

# Precompile assets for production
ARG RAILS_ENV=development
RUN if [ "$RAILS_ENV" = "production" ]; then \
  bundle exec rake assets:precompile; \
  fi

RUN rm -f /app/tmp/pids/server.pid

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000", "-e", "development"]
