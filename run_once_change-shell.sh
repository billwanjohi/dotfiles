#!/usr/bin/env sh

# requires sudo
chsh -s /bin/zsh $(whoami)

git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
