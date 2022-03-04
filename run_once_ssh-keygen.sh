#!/usr/bin/env bash

set -Eeuxo pipefail

if [[ ! -f ~/.ssh/id_ed25519 ]]
then
    ssh-keygen -t ed25519 -a 100
fi
