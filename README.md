# dotfiles

This is a homesick castle.
You can pull and symlink using that ruby gem,
or just do so manually.
This works on OSX and Linux.

Features:

-   git-based installations of the following packages:
    -   janus (Vim plugin suite)
    -   oh-my-zsh
    -   gvm - go version manager
    -   rbenv - ruby environment manager
-   configuration files for:
    -   ack
    -   irb
    -   psql
    -   tmux
    -   vim
    -   zsh
    -   vagrant
-   installation instructions for many other dev packages

## Installation

1.  Run these bash commands:

    ```bash
    brew install git || sudo apt-get install git
    [sudo] gem install homesick
    rbenv rehash # OK if fails
    homesick clone https://github.com/billwanjohi/dotfiles.git
    homesick list
    homesick symlink [dotfiles]
    cp $HOME/.config/git/user.example $HOME/.config/git/user
    ```

2.  edit ~/.config/git/user to include your details
3.  manually invoke relevant lines in .homesickrc file

## Update submodules

`git submodule foreach git pull origin master`

## TODO
*   test google-drive alternatives
*   add source highlight for LESS
*   make homesickrc automatic, idempotent
    *   check OS, virtual-ness, run relevant shell script
