export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/go/bin:$PATH
export PATH=$HOME/.nix-profile/bin:$PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
