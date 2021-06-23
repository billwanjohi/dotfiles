# This file is run on non-interactive shells
export PATH=~/.emacs.d/bin:$PATH
export TERMINAL=alacritty

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

alias pause-notifications="killall -SIGUSR1 dunst"
alias resume-notifications="killall -SIGUSR2 dunst"
