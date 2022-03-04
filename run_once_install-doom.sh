#!/usr/bin/env bash

set -Eeuxo pipefail

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask emacs
if [[ ! -d ~/.emacs.d ]]
then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
fi
~/.emacs.d/bin/doom install
