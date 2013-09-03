# dotfiles

This is a homesick castle. You can pull and symlink using that ruby gem,
or just do so manually. At this point, much of this is specific to OSX,
but I intend to clean this up to work fully on Linux too.

## Installation

```bash
[sudo] gem install homesick
rbenv rehash
homesick clone https://github.com/billwanjohi/dotfiles.git
homesick symlink [dotfiles]
```

### Loose ends

*   change your name, email in .gitconfig
*   provide your own .privaterc

## TODO
*   brew cask install iterm2
*   brew cask install google-drive, twice
*   brew cask install dropbox, twice
*   split mac and linux configurations
*   pull request for newer tmuxinator oh-my-zsh plugin
*   remove vim-colors-solarized (redundant)
