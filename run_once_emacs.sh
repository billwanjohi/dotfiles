#!/usr/bin/env bash

set -Eeuxo pipefail

if ! [ -x "$(command -v brew)" ]
then
    sudo chown "$(whoami)":admin \
        /usr/local/share/zsh \
        /usr/local/share/zsh/site-functions

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install \
    fd \
    homebrew/cask-fonts/font-space-mono-nerd-font \
    ripgrep
    # pandoc \
    # plantuml \
    # prettier \
    # shellcheck

brew install --cask --no-quarantine emacs

EMACS_DIR=$HOME/.emacs.d

if [[ ! -d $EMACS_DIR ]]
then
    git clone --depth 1 https://github.com/hlissner/doom-emacs $EMACS_DIR
    $EMACS_DIR/bin/doom install
fi
