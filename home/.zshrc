# Which zsh file should I put X?
# https://unix.stackexchange.com/a/71258/32186

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

## official and custom directories
ZSH=/usr/share/oh-my-zsh  # ~/.oh-my-zsh for homebrew
ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
ZSH_CUSTOM=$XDG_CONFIG_HOME/oh-my-zsh

## oh-my-zsh options
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"  # so tmuxinator names stick
DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="false"
ZSH_TMUX_AUTOSTART="false"

## Themes
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins
# "random" is fun
# "robby-lite" is custom and good
# "kennethreitz" is pretty, and is venv aware
# "robbyrussell" looks good on it's own, but not with git-prompt
# "bureau" works with (instead of?) git-prompt
ZSH_THEME=""  # we're configuring this in pure.zsh

plugins=()
plugins+=('archlinux')        # pacman/pacaur
#plugins+=('brew')              # mac only
#plugins+=('bundler')           # don't use ruby much anymore
plugins+=('cargo')
plugins+=('colored-man')
plugins+=('colorize')         # pygments in pager
#plugins+=('docker')
#plugins+=('docker-compose')
plugins+=('emacs')            # aliases
#plugins+=('emoji')
plugins+=('git')              # aliases, completion
#plugins+=('gitfast')
#plugins+=('github')
#plugins+=('git-prompt')       # right-side prompt that pulls from remote
plugins+=('minikube')         # custom plugin to give me completion
plugins+=('npm')         # custom plugin to give me completion
#plugins+=('osx')               # mac only
#plugins+=('pip')
plugins+=('pyenv')            # handles initialization
#plugins+=('python')
#plugins+=('rbenv')             # don't use ruby much anymore
#plugins+=('ruby')
plugins+=('rust')
#plugins+=('terraform')
plugins+=('tmux')             # can't remember
#plugins+=('tmuxinator')
#plugins+=('vagrant')
#plugins+=('virtualenv')
#plugins+=('yarn')

source $ZSH/oh-my-zsh.sh

###### User configuration

# use prefix to specify gnu version of a core utility on OSX
if [[ $OSTYPE != "linux-gnu" ]]; then
    gnu_prefix=g
fi

alias gcolt="git checkout \`git tag | ${gnu_prefix}sort -V | tail -1\`"
alias gitroot="git rev-parse --show-toplevel"
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
export LESS="--RAW-CONTROL-CHARS --quit-if-one-screen"
export TZ=UTC

# zsh help (for built-in commands) -- invoke with Alt-h
# http://zshwiki.org/home/builtin/functions/run-help
[[ -d /usr/local/share/zsh/helpfiles ]] && HELPDIR=/usr/local/share/zsh/helpfiles # homebrew
[[ -d /usr/share/zsh/help ]] && HELPDIR=/usr/share/zsh/help # aptitude
unalias run-help 2> /dev/null # in case already unaliased
autoload run-help run-help-git
