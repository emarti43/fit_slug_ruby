FROM ruby:2.4

WORKDIR /application

RUN gem install bundler

COPY Gemfile /application

RUN bundle install

COPY . /application

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0 "]
