FROM ruby:2.6.3

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client
ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN gem install bundler:2.2.11
RUN bundle install
EXPOSE 3000
CMD ["bash"]
