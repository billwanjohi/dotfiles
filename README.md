# dotfiles

This is a homesick castle. You can pull and symlink using that ruby gem,
or just do so manually. This works on OSX and Linux.

Homeshick seems to work too.

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
*   test google-drive alternatives
*   remove vim-colors-solarized (redundant)
*   add source highlight for LESS
*   make homesickrc automatic, idempotent
*   consider homeshick, to remove ruby dependency
