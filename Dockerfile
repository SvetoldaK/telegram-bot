FROM ruby:3.1.0-alpine

ENV RAILS_ENV=development
ENV APP_HOME=/app
ENV PORT=3000
ENV LAUNCHY_DRY_RUN=true
ENV BROWSER=/dev/null

WORKDIR $APP_HOME
RUN mkdir -p $APP_HOME/app

RUN apk add --no-cache tzdata postgresql-dev g++ nodejs make
RUN gem install bundler

COPY Gemfile* $APP_HOME/
RUN bundler install

COPY . $APP_HOME

EXPOSE $PORT

CMD bundle exec rails db:create db:migrate && bundle exec rails s -b 0.0.0.0 & ruby telegram/bot.rb
