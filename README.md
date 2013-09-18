# dotfiles

This is a homesick castle. You can pull and symlink using that ruby gem,
or just do so manually. This works on OSX and Linux.

## Installation

```bash
[sudo] apt-get/brew install git
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
*   split mac and linux configurations
*   pull request for newer tmuxinator oh-my-zsh plugin
*   remove vim-colors-solarized (redundant)
*   add source highlight for LESS
*   make homesickrc idempotent
*   consider homeshick, to remove ruby dependency
