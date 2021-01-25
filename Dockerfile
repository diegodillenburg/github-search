FROM ruby:3.0

ARG INSTALL_PATH
ARG RAILS_PORT

RUN apt-get update \
  && apt-get install -qq -y --no-install-recommends \
    build-essential \
    git \
    libpq-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --pre
RUN bundle install

COPY . .
EXPOSE $RAILS_PORT
