brew install zsh
grep -q $(which zsh) /etc/shells ||            # if brew-zsh not in whitelist
  echo $(which zsh) | sudo tee -a /etc/shells  #   add it
echo $SHELL | grep $(which zsh) ||             # if brew-zsh not default
  chsh -s $(which zsh)                         #   set it
