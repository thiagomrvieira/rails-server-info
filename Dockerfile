FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs

WORKDIR /rails-server-info

COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.4.10
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
