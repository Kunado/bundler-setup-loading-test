FROM ruby:2.6.3-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile* ./
COPY package.json ./
COPY yarn.lock ./

ARG BUNDLER_VERSION=2.0.1

RUN apk upgrade && \
    apk add --no-cache --update \
      nodejs \
      yarn \
      tzdata \
      sqlite-dev \
      libc-dev \
      curl-dev \
      libxml2-dev \
      make \
      gcc \
      git && \
    gem install bundler -v $BUNDLER_VERSION

COPY entrypoint.sh /usr/bin/entrypoint
RUN chmod +x /usr/bin/entrypoint
ENTRYPOINT ["entrypoint"]
EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
