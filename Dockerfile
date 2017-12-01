FROM ruby:2.4.1-alpine
MAINTAINER ducdiepco@gmail.com
RUN apk --update add --virtual build-dependencies ruby-dev build-base nodejs postgresql-dev
RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --without development test
ENV SMTP_ADDRESS=smtp.example.com
ENV SMTP_DOMAIN=example.com
ENV SMTP_PASSWORD=password
ENV SMTP_USERNAME=username
ENV APPLICATION_HOST=localhost:3000
EXPOSE 3000
