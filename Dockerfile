FROM ruby:2.5.1

RUN apt-get update -yqq &&\
    apt-get install -yqq \
    postgresql-client \
    nodejs \
    yarn \
    nano \
    && apt-get -q clean \
    && rm -rf /var/lib/apt/lists

RUN mkdir /enjublog
WORKDIR /enjublog
COPY Gemfile /enjublog/Gemfile
COPY Gemfile.lock /enjublog/Gemfile.lock

ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $BUNDLE_BIN:$PATH

RUN gem update --system --quiet && \
    gem install  bundler -v '~> 2.1'

ENV BUNDLER_VERSION 2.1
RUN bundle install

EXPOSE 5432

COPY . /enjublog

RUN chmod +x /enjublog/entrypoint.sh
