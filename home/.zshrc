# Which zsh file should I put X?
# https://unix.stackexchange.com/a/71258/32186
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# .zshrc - interactive shell configuration
##########################################

# Before plugin load
####################

## Specify XDG Base Directories
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-0.7.html
# These are all default values, and so technically redundant,
# but setting them might coerce an app that only has optional support
# to recognize that this user very much wants it.

export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME=$HOME/.config
#export XDG_DATA_DIRS=/usr/local/share/:/usr/share/
export XDG_DATA_HOME=$HOME/.local/share
#export XDG_RUNTIME_DIR=

### oh-my-zsh options
#COMPLETION_WAITING_DOTS="true"
#DISABLE_AUTO_TITLE="true"  # so tmuxinator names stick
#DISABLE_CORRECTION="true"
#DISABLE_UNTRACKED_FILES_DIRTY="false"
#ZSH_TMUX_AUTOSTART="false"
#PURE_CMD_MAX_EXEC_TIME=1

#zplug lib/bzr, from:oh-my-zsh
#zplug lib/correction, from:oh-my-zsh
#zplug lib/diagnostics, from:oh-my-zsh
#zplug lib/git, from:oh-my-zsh
#zplug lib/grep, from:oh-my-zsh
#zplug lib/key-bindings, from:oh-my-zsh
#zplug lib/misc, from:oh-my-zsh
#zplug lib/nvm, from:oh-my-zsh
#zplug lib/prompt_info_functions, from:oh-my-zsh
#zplug lib/spectrum, from:oh-my-zsh
#zplug lib/termsupport, from:oh-my-zsh
#zplug lib/theme-and-appearance, from:oh-my-zsh
zplug $HOME/.config/oh-my-zsh/spantree.zsh, from:local
zplug lib/clipboard, from:oh-my-zsh
zplug lib/compfix, from:oh-my-zsh
zplug lib/completion, from:oh-my-zsh
zplug lib/directories, from:oh-my-zsh
zplug lib/functions, from:oh-my-zsh
zplug lib/history, from:oh-my-zsh
zplug mafredri/zsh-async, from:github
#zplug plugins/archlinux, from:oh-my-zsh
zplug plugins/brew, from:oh-my-zsh
zplug plugins/cargo, from:oh-my-zsh
zplug plugins/colored-man, from:oh-my-zsh
zplug plugins/colorize, from:oh-my-zsh
zplug plugins/docker, from:oh-my-zsh
zplug plugins/docker-compose, from:oh-my-zsh
zplug plugins/emacs, from:oh-my-zsh
zplug plugins/git, from:oh-my-zsh
zplug plugins/minikube, from:oh-my-zsh
zplug plugins/osx, from:oh-my-zsh
zplug plugins/rust, from:oh-my-zsh
zplug plugins/tmux, from:oh-my-zsh
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug spwhitt/nix-zsh-completions, from:github
zplug wting/autojump, use:bin/autojump.zsh, from:github

if ! zplug check; then
    zplug install
fi

zplug load # --verbose

###### User configuration

# use prefix to specify gnu version of a core utility on OSX
if [[ $OSTYPE != "linux-gnu" ]]; then
    gnu_prefix=g
fi

alias lss="ls -a"
alias findalias="alias | ag"
alias gcolt="git checkout \`git tag | ${gnu_prefix}sort -V | tail -1\`"
alias gitroot="git rev-parse --show-toplevel"
alias gpfwl="git push --force-with-lease"
alias gs="echo 'did you mean gss?'"
alias lss="ls -A"
# TODO: use XDG log location
alias psql_log="psql -e -L ~/logs/psql/$(date +%Y_%m_%d).txt"
alias rsync="echo run as root"
alias ttree="tree --filelimit 64 -aC -I .git"
alias vi="echo 'do you mean vim?'"
alias xo=xdg-open

export EDITOR=vim  # todo: figure out how to use `emacsclient -t`
export LANG=en_US.UTF-8
export LESS="--quit-if-one-screen --ignore-case --RAW-CONTROL-CHARS --no-init"
export TZ=UTC

# zsh help (for built-in commands) -- invoke with Alt-h
# http://zshwiki.org/home/builtin/functions/run-help
[[ -d /usr/local/share/zsh/helpfiles ]] && HELPDIR=/usr/local/share/zsh/helpfiles # homebrew
[[ -d /usr/share/zsh/help ]] && HELPDIR=/usr/share/zsh/help # aptitude
unalias run-help 2> /dev/null # in case already unaliased
autoload run-help run-help-git
