FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp
# 開発と本番環境でイメージを共有させたいので、下記2行はデプロイ時に行う
# ARG RAILS_MASTER_KEY
# RUN DB_ADAPTER=nulldb RAILS_ENV=production bundle exec rake assets:precompile
