#!/usr/bin/env bash

set -Eeuxo pipefail

if ! [ -x "$(command -v brew)" ]
then
    sudo chown "$(whoami)":admin \
        /usr/local/share/zsh \
        /usr/local/share/zsh/site-functions

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install --cask --no-quarantine \
    alacritty \
    amethyst \
    firefox \
    meetingbar \
    pomotroid \
    # aws-vault \
    # docker \
    # google-chrome \
    # jetbrains-toolbox \
    # microsoft-teams \
    # vscodium \
    # zoom

brew install \
    asdf \
    bat \
    gnupg \
    httpie \
    tldr \
    tmux
    # awscli \
    # coreutils \
    # editorconfig \
    # fzf \
    # git \
    # graphviz \
    # jmespath/jmespath/jp \
    # lazydocker \
    # lazygit \
    # node@16 \
    # pandoc \
    # prettier \
    # shellcheck \
