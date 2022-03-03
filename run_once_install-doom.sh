#!/usr/bin/env bash

set -Eeuxo pipefail

if [[ ! -d ~/.emacs.d ]]
then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
fi
~/.emacs.d/bin/doom install
