FROM ruby:2.6.9-slim-bullseye
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q update && apt-get -y -q install build-essential

ENV APP_HOME /usr/share/dgvz
WORKDIR $APP_HOME

# load the app
COPY . $APP_HOME

RUN bundle install
