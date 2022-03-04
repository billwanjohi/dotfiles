#!/usr/bin/env bash

set -Eeuxo pipefail

defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
