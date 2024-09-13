FROM ruby:3.3.4

RUN curl -sL https://deb.nodesource.com/setup_current.x | bash - \
    && apt-get install -y nodejs yarn

RUN apt-get update -qq && \
    apt-get install --force-yes -y \
                    build-essential \
                    libpq-dev \
                    curl \
                    vim \
                    less \
                    mariadb-client \
                    libsodium-dev

WORKDIR /test_app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
