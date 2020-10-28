# build stage
FROM ruby:2.7.2-alpine AS builder

ARG build_without
ARG rails_env="development"
ARG to_remove

ENV SECRET_KEY_BASE=dumb
ENV EXECJS_RUNTIME=Node

RUN apk add --update --no-cache \
    openssl \
    tar \
    build-base \
    tzdata \
    postgresql-dev \
    postgresql-client \
    nodejs \
  && wget https://yarnpkg.com/latest.tar.gz \
  && mkdir -p /opt/yarn \
  && tar -xf latest.tar.gz -C /opt/yarn --strip 1 \
  && mkdir -p /var/app

ENV PATH="$PATH:/opt/yarn/bin" BUNDLE_JOBS=4 RAILS_ENV=${rails_env} BUNDLE_WITHOUT=${bundle_without}

COPY . /var/app
WORKDIR /var/app

RUN bundle install && yarn && bundle exec rake assets:precompile \
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete \
 && rm -rf $to_remove

# final stage
FROM ruby:2.7.2-alpine
LABEL maintainer="contato@opensanca.com.br"

ARG extra_packages

RUN apk add --update --no-cache \
    openssl \
    tzdata \
    postgresql-dev \
    postgresql-client \
    $extra_packages

COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder /var/app /var/app

ENV RAILS_LOG_TO_STDOUT true

WORKDIR /var/app

EXPOSE 3000

CMD bin/rails s -b 0.0.0.0
