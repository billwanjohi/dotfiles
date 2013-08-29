# assumes osx
set -ex
brew doctor
brew update
brew install zsh
echo "/usr/local/bin/zsh" |
  sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
