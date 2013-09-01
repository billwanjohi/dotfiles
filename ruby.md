cd $PROJ_DIR
rbenv install < .ruby-version
gem update --system
gem install bundler
bundle install --without doc production
rake db:setup
rspec
passenger start
