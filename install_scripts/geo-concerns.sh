#!/bin/sh

echo "Creating a stock Geo Concerns app"

# Create a curation-concerns app
rails new geo-concerns-demo --skip-spring
cd geo-concerns-demo
echo 'gem "geo_concerns",  "~>0.0.10"' >> Gemfile
bundle install
yes Y | rails generate curation_concerns:install
yes Y | rails generate geo_concerns:install
rake db:migrate

SHARED_DIR=$1

# Copy in new Rakefile
yes | cp -rf $SHARED_DIR/install_scripts/Rakefile .

# Run the setup
rake demo:setup
