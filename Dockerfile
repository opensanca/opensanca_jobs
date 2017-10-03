FROM ruby:2.4-alpine
MAINTAINER opensanca@opensanca.com

RUN apk update \
  && apk add \
    openssl \
    tar \
    build-base \
    tzdata \
    postgresql-dev \
    nodejs \
  && wget https://yarnpkg.com/latest.tar.gz \
  && mkdir -p /opt/yarn \
  && tar -xf latest.tar.gz -C /opt/yarn --strip 1 \
  && mkdir -p /var/app

ENV PATH="$PATH:/opt/yarn/bin" BUNDLE_PATH="/gems" BUNDLE_JOBS=2

COPY . /var/app
WORKDIR /var/app

RUN bundle install && yarn && bundle exec rake assets:precompile
CMD rails s -b 0.0.0.0
