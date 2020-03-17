FROM ruby:2.5.1
RUN apt-get update -yqq \
  && apt-get install -yqq \
    postgresql-client \
    nodejs \
    yarn \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists
RUN mkdir /enjublog
WORKDIR /enjublog
COPY Gemfile /enjublog/Gemfile
RUN \
  gem update --system --quiet && \
  gem install  bundler -v '~> 2.1'
ENV BUNDLER_VERSION 2.1
RUN bundle install
CMD yarn install --check-files
COPY . /enjublog
