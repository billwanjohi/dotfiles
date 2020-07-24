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

eval "$(starship init zsh)"

#zplug lib/bzr, from:oh-my-zsh
#zplug lib/correction, from:oh-my-zsh
#zplug lib/diagnostics, from:oh-my-zsh
#zplug lib/git, from:oh-my-zsh
#zplug lib/grep, from:oh-my-zsh
#zplug lib/misc, from:oh-my-zsh
#zplug lib/nvm, from:oh-my-zsh
#zplug lib/prompt_info_functions, from:oh-my-zsh
#zplug lib/spectrum, from:oh-my-zsh
#zplug lib/termsupport, from:oh-my-zsh
#zplug lib/theme-and-appearance, from:oh-my-zsh
#zplug plugins/archlinux, from:oh-my-zsh
#zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
#zplug plugins/emacs, from:oh-my-zsh
zplug $HOME/.config/oh-my-zsh, use:spaceship.zsh, from:local
zplug $HOME/.config/oh-my-zsh, use:spantree.zsh, from:local
# zplug denysdovhan/spaceship-prompt, use:spaceship.zsh, from:github, as:theme
zplug lib/clipboard, from:oh-my-zsh
zplug lib/compfix, from:oh-my-zsh
zplug lib/completion, from:oh-my-zsh
zplug lib/directories, from:oh-my-zsh
zplug lib/functions, from:oh-my-zsh
zplug lib/history, from:oh-my-zsh
zplug lib/key-bindings, from:oh-my-zsh   # needed for reverse-menu-complete
zplug mafredri/zsh-async, from:github
zplug plugins/brew, from:oh-my-zsh
zplug plugins/cargo, from:oh-my-zsh
zplug plugins/colored-man, from:oh-my-zsh
zplug plugins/colorize, from:oh-my-zsh
zplug plugins/docker, from:oh-my-zsh
zplug plugins/docker-compose, from:oh-my-zsh
zplug plugins/git, from:oh-my-zsh
zplug plugins/minikube, from:oh-my-zsh
zplug plugins/osx, from:oh-my-zsh
zplug plugins/rust, from:oh-my-zsh
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

alias findalias="alias | ag"
alias gcolt="git switch $(git tag | ${gnu_prefix}sort -V | tail -1)"
alias glfod="git ls-files --others --directory"
alias gitroot="git rev-parse --show-toplevel"
alias gdls='git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done'
alias gpfwl="git push --force-with-lease"
alias gs="echo 'did you mean gss?'"
alias lss="ls -A"
alias neovim="echo 'do you mean nvim?'"
alias psql_log="psql -e -L ${XDG_DATA_HOME}/psql/logs/$(date +%Y_%m_%d).txt"
alias rsync="echo run as root"
alias te="emacsclient -t"
alias ttree="tree --filelimit 64 -aC -I .git"
alias vi="echo 'do you mean vim?'"
alias vim=nvim
alias yes="echo no"
alias xo=xdg-open

bindkey -e  # [Always use emacs-style zsh bindings](https://superuser.com/a/457401/145170)

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

# https://github.com/Homebrew/homebrew-cask/issues/52560
# Affects me because I disabled the path_helper
export PATH=$PATH:/usr/local/share/dotnet
source <(aws-okta completion zsh)

# ASDF
source /usr/local/opt/asdf/asdf.sh
source /usr/local/etc/bash_completion.d/asdf.bash

# direnv
eval "$(direnv hook zsh)"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/bill/projects/customers/lincoln/lincolnsec-ics-form-builder/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/bill/projects/customers/lincoln/lincolnsec-ics-form-builder/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/bill/projects/customers/lincoln/lincolnsec-ics-form-builder/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/bill/projects/customers/lincoln/lincolnsec-ics-form-builder/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/bill/projects/customers/lincoln/lincolnsec-ics-form-builder/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/bill/projects/customers/lincoln/lincolnsec-ics-form-builder/node_modules/tabtab/.completions/slss.zsh

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"


export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=/usr/local/lib/ruby/gems/2.7.0/bin:$PATH
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

export PIPENV_VERBOSITY=-1
