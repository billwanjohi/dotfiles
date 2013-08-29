# install `Command Line Tools` within XCode
brew update
brew doctor
brew install rbenv
brew install ruby-build
brew install readline
brew install postgresql
cd $PROJ_DIR
rbenv install < .ruby-version
git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
gem update --system
gem install bundler
bundle install --without doc production
rake db:setup
rspec
passenger start
