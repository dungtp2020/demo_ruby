FROM ruby:3.0.0

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    nodejs \
    postgresql-client \
    yarn

# Set an environment variable for the app's path
ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install gems
COPY Gemfile* $APP_HOME/
RUN bundle install

# Copy the rest of the application code
COPY . $APP_HOME/

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
