ARG RUBY_VERSION=3.1.2
ARG NODE_VERSION=20.1.0

FROM node:$NODE_VERSION-slim as node

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install

FROM ruby:$RUBY_VERSION-slim as base

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y build-essential locales libvips libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /app

FROM base as gems

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

FROM base as build

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

COPY . ./
COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin
COPY --from=node /opt /opt
COPY --from=node /app/node_modules /app/node_modules
COPY --from=gems /usr/local/bundle /usr/local/bundle

EXPOSE 3000

CMD ["bin/start"]
