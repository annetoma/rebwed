FROM ruby:2.4.0

RUN apt-get update && apt-get install -y \
    git \
    imagemagick \
    libxslt-dev \
    libxml2-dev \
    libffi-dev \
    make \
    nodejs \
    libpq-dev \
    tar \
    vim

RUN mkdir /app
RUN mkdir /data

ADD Gemfile* /app/

WORKDIR /app
RUN gem install bundler foreman \
    && bundle config git.allow_insecure true \
    && bundle config build.nokogiri --use-system-libraries \
    && bundle install --jobs 4 --retry 5

ADD . /app

CMD ["foreman", "start"]
