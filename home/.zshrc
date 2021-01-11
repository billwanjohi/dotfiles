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

HISTFILE=~/.zsh_history
HISTSIZE=100000
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
ZSH_THEME=""  # we're configuring this with starship

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

# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh
#
# #zplug lib/bzr, from:oh-my-zsh
# #zplug lib/correction, from:oh-my-zsh
# #zplug lib/diagnostics, from:oh-my-zsh
# #zplug lib/git, from:oh-my-zsh
# #zplug lib/grep, from:oh-my-zsh
# #zplug lib/misc, from:oh-my-zsh
# #zplug lib/nvm, from:oh-my-zsh
# #zplug lib/prompt_info_functions, from:oh-my-zsh
# #zplug lib/spectrum, from:oh-my-zsh
# #zplug lib/termsupport, from:oh-my-zsh
# #zplug lib/theme-and-appearance, from:oh-my-zsh
# #zplug plugins/archlinux, from:oh-my-zsh
# #zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
# #zplug plugins/emacs, from:oh-my-zsh
# # zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
# zplug lib/clipboard, from:oh-my-zsh
# zplug lib/compfix, from:oh-my-zsh
# zplug lib/completion, from:oh-my-zsh
# zplug lib/directories, from:oh-my-zsh
# zplug lib/functions, from:oh-my-zsh
# zplug lib/history, from:oh-my-zsh
# zplug lib/key-bindings, from:oh-my-zsh   # needed for reverse-menu-complete
# zplug mafredri/zsh-async, from:github
# zplug plugins/brew, from:oh-my-zsh
# zplug plugins/cargo, from:oh-my-zsh
# zplug plugins/colored-man, from:oh-my-zsh
# zplug plugins/colorize, from:oh-my-zsh
# zplug plugins/docker, from:oh-my-zsh
# zplug plugins/docker-compose, from:oh-my-zsh
# zplug plugins/git, from:oh-my-zsh
# zplug plugins/minikube, from:oh-my-zsh
# zplug plugins/osx, from:oh-my-zsh
# zplug plugins/rust, from:oh-my-zsh
# zplug spwhitt/nix-zsh-completions, from:github

# if ! zplug check; then
#     zplug install
# fi

# zplug load # --verbose

###### User configuration

# use prefix to specify gnu version of a core utility on OSX
if [[ $OSTYPE != "linux-gnu" ]]; then
    gnu_prefix=g
fi

## Alias section
alias cp="cp -i"  # Confirm before overwriting something
alias df="df -h"
alias findalias="alias | ag"
alias gcolt='git checkout $(git tag | ${gnu_prefix}sort -V | tail -1)'
alias glfod="git ls-files --others --directory"
alias gitroot="git rev-parse --show-toplevel"
alias gdls='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gpfwl="git push --force-with-lease"
alias grbfom="git rebase --autostash -i $(git merge-base master HEAD)"
alias gs="echo 'did you mean gss?'"
alias lss="ls -A"
alias neovim="echo 'do you mean nvim?'"
alias psql_log="psql -e -L ${XDG_DATA_HOME}/psql/logs/$(date +%Y_%m_%d).txt"
alias rsync="echo run as root"
alias screengrab=import
alias te="emacsclient -t"
alias ttree="tree --filelimit 64 -aC -I .git"
alias vi="echo 'do you mean vim?'"
alias vim=nvim
alias yes="echo no"
alias xo=xdg-open

# [Always use emacs-style zsh bindings](https://superuser.com/a/457401/145170)
bindkey -e

export EDITOR=nvim
export LANG=en_US.UTF-8
export LESS="--quit-if-one-screen --ignore-case --RAW-CONTROL-CHARS --no-init"
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export TZ=UTC

# zsh help (for built-in commands) -- invoke with Alt-h
# http://zshwiki.org/home/builtin/functions/run-help
[[ -d /usr/local/share/zsh/helpfiles ]] && HELPDIR=/usr/local/share/zsh/helpfiles # homebrew
[[ -d /usr/share/zsh/help ]] && HELPDIR=/usr/share/zsh/help # aptitude
unalias run-help 2> /dev/null # in case already unaliased
autoload run-help run-help-git

eval "$(direnv hook zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
