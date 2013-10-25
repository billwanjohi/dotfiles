# dotfiles

This is a homesick castle. You can pull and symlink using that ruby gem,
or just do so manually. This works on OSX and Linux.

Homeshick seems to work too, but I don't like it's implementation of
symlinks (symlinks all tracked files, ignores .homesick_subdir, ignores
new files)

## Installation

```bash
[sudo] apt-get/brew install git
[sudo] gem install homesick
rbenv rehash
homesick clone https://github.com/billwanjohi/dotfiles.git
homesick list
homesick symlink [dotfiles]
```

For now, you should manually work through .homesickrc script

### Loose ends

*   change your name, email in .gitconfig
*   provide your own .privaterc

## TODO
*   test google-drive alternatives
*   add source highlight for LESS
*   make homesickrc automatic, idempotent
    *   check OS, virtual-ness, run relevant shell script
*   consider homeshick, to remove ruby dependency
