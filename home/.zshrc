# Which zsh file should I put X?
# https://unix.stackexchange.com/a/71258/32186

# .zshrc - interactive shell configuration
##########################################

## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=500
export EDITOR=/usr/bin/nvim
#export VISUAL=/usr/bin/nano
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word


## Keybindings section
bindkey -e
bindkey '^[[7~' beginning-of-line                               # Home key
bindkey '^[[H' beginning-of-line                                # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line                # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                                     # End key
bindkey '^[[F' end-of-line                                     # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line                       # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                                  # Insert key
bindkey '^[[3~' delete-char                                     # Delete key
bindkey '^[[C'  forward-char                                    # Right key
bindkey '^[[D'  backward-char                                   # Left key
bindkey '^[[5~' history-beginning-search-backward               # Page up key
bindkey '^[[6~' history-beginning-search-forward                # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word                                     #
bindkey '^[Od' backward-word                                    #
bindkey '^[[1;5D' backward-word                                 #
bindkey '^[[1;5C' forward-word                                  #
bindkey '^H' backward-kill-word                                 # delete previous word with ctrl+backspace
bindkey '^[[Z' undo                                             # Shift+tab undo last action



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
plugins+=('asdf')
#plugins+=('brew')              # mac only
#plugins+=('bundler')           # don't use ruby much anymore
plugins+=('cargo')
#plugins+=('colored-man')
plugins+=('colorize')         # pygments in pager
#plugins+=('docker')
#plugins+=('docker-compose')
plugins+=('emacs')            # aliases
#plugins+=('emoji')
plugins+=('git')              # aliases, completion
#plugins+=('gitfast')
#plugins+=('github')
#plugins+=('git-prompt')       # right-side prompt that pulls from remote
# plugins+=('minikube')         # custom plugin to give me completion
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

## Alias section
alias cp="cp -i"                                                # Confirm before overwriting something
alias df="df -h"
alias gcolt="git checkout \`git tag | ${gnu_prefix}sort -V | tail -1\`"
alias gitroot="git rev-parse --show-toplevel"
alias glfod="git ls-files --others --directory"
alias gs="echo 'did you mean gss?'"
alias lss="ls -A"
# TODO: use XDG log location
alias psql_log="psql -e -L ~/logs/psql/$(date +%Y_%m_%d).txt"
alias rsync="echo run as root"
alias screengrab=import
alias ttree="tree --filelimit 64 -aC -I .git"
alias vi="echo 'do you mean vim?'"
alias xo=xdg-open

export EDITOR=vim  # todo: figure out how to use `emacsclient -t`
export LANG=en_US.UTF-8
export LESS="--RAW-CONTROL-CHARS --quit-if-one-screen"
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export TZ=UTC

# zsh help (for built-in commands) -- invoke with Alt-h
# http://zshwiki.org/home/builtin/functions/run-help
[[ -d /usr/local/share/zsh/helpfiles ]] && HELPDIR=/usr/local/share/zsh/helpfiles # homebrew
[[ -d /usr/share/zsh/help ]] && HELPDIR=/usr/share/zsh/help # aptitude
unalias run-help 2> /dev/null # in case already unaliased
autoload run-help run-help-git

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
