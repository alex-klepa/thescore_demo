FROM ruby:2.7.1
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
RUN yarn install
COPY . .
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]