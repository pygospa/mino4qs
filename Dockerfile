################################################################# BUILDER image
# build-base+gcompat    for gem compilation
# postgresql-dev	for pg gem
# nodejs+tzdata		for rails
FROM ruby:2.6.3-alpine3.10 as Builder
RUN apk add --no-cache build-base \
		       gcompat \
		       nodejs \
		       postgresql-dev \
		       tzdata \
		       yarn
WORKDIR /srv/mino4qs
COPY Gemfile Gemfile.lock package.json yarn.lock ./
RUN bundle install && \
    rm -rf $BUNDLE_PATH/cache/*.gem && \
    find $BUNDLE_PATH/gems/ -name "*.c" -delete && \
    find $BUNDLE_PATH/gems/ -name "*.o" -delete && \
    yarn install
COPY . .

################################################################### Final Stage
FROM ruby:2.6.3-alpine3.10
RUN apk add --no-cache gcompat \
                       nodejs \
		       postgresql-client \
		       tzdata \
		       yarn
WORKDIR /srv/mino4qs
COPY --from=Builder $BUNDLE_PATH $BUNDLE_PATH
