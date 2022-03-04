#!/usr/bin/env bash

set -Eeuxo pipefail

sudo chown "$(whoami)":admin /usr/local/share/zsh /usr/local/share/zsh/site-functions
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install \
    git-delta \
    lsd \
    neovim \
    zinit \
    zoxide
