set -ex
brew install zsh || sudo apt-get install zsh
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
