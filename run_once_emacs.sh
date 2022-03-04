#!/usr/bin/env bash

set -Eeuxo pipefail

if ! [ -x "$(command -v brew)" ]
then
    sudo chown "$(whoami)":admin /usr/local/share/zsh/site-functions
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew install \
    fd \
    homebrew/cask-fonts/font-space-mono-nerd-font \
    rg
brew install --cask --no-quarantine emacs
if [[ ! -d ~/.emacs.d ]]
then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
fi
~/.emacs.d/bin/doom install
