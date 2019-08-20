# build-base		for gem compilation
# postgresql-dev	for pg gem
# nodejs+tzdata		for rails

FROM ruby:2.6.3-alpine
RUN apk add --no-cache build-base \
		       gcompat \
		       nodejs \
		       postgresql-dev \
		       tzdata
WORKDIR /srv/mino
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
