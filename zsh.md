brew doctor
brew update
brew install zsh
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /usr/local/bin/zsh
# confirm zshrc placed
