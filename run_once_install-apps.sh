#!/usr/bin/env bash

set -Eeuxo pipefail

if ! [ -x "$(command -v brew)" ]
then
    sudo chown "$(whoami)":admin /usr/local/share/zsh/site-functions
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew install --cask --no-quarantine \
    alacritty \
    amethyst

brew install \
    bat \
    tmux
