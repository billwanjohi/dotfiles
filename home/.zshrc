export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"  # or "random" for fun
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=~/.zsh_custom
DISABLE_AUTO_TITLE="true"  # so tmuxinator names stick
DISABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="false"

plugins=(
  brew
  docker
  docker-compose
  emacs
  git
  pyenv
  rbenv
  tmux
)

#futureplugins(
#  archlinux
#  colored-man
#  npm
#  pip
#  terraform
#  vagrant
#  virtualenv
#)

#rejectedplugins(
#  bundler
#  emoji
#  github
#  osx
#  python
#  ruby
#  tmuxinator
#  yarn
#)

source $ZSH/oh-my-zsh.sh

###### User configuration

# use prefix to specify gnu version of a core utility on OSX
if [[ $OSTYPE != "linux-gnu" ]]; then
    gnu_prefix=g
fi

alias findalias="alias | ag"
alias gcolt="git checkout \`git tag | ${gnu_prefix}sort -V | tail -1\`"
alias gpfwl="git push --force-with-lease"
alias psql_log="psql -e -L ~/logs/psql/$(date +%Y_%m_%d).txt"
alias ttree="tree --filelimit 16 -aC -I .git"
alias vi=vim

export LANG=en_US.UTF-8
export LESS="--quit-if-one-screen --ignore-case --RAW-CONTROL-CHARS --no-init"
export TZ=UTC

# zsh help (for built-in commands) -- invoke with Alt-h
# http://zshwiki.org/home/builtin/functions/run-help
[[ -d /usr/local/share/zsh/helpfiles ]] && HELPDIR=/usr/local/share/zsh/helpfiles # homebrew
[[ -d /usr/share/zsh/help ]] && HELPDIR=/usr/share/zsh/help # aptitude
unalias run-help 2> /dev/null # in case already unaliased
autoload run-help run-help-git
