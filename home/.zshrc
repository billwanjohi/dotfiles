# oh-my-zsh config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="tjkirch" # or "random" for fun
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="true"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="true"  # so tmuxinator names stick
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="false"
plugins=(
  brew
  bundler
  capistrano
  extract
  gem
  git
  hub
  rails
  tmux
  tmuxinator
  vagrant
  virtualenvwrapper
)
source $ZSH/oh-my-zsh.sh

if [[ $OSTYPE != "linux-gnu" ]]; then
  gnu_prefix=g
fi

alias homeshick="source $HOME/.homesick/repos/homeshick/bin/homeshick.sh"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim  ~/.oh-my-zsh"
alias vim="vim -p"
alias vi="vim"
alias gdc="git diff --cached"
alias gap="git add --patch"
alias gcolt="git checkout \`git tag | ${gnu_prefix}sort -V | tail -1\`"
alias redsql="psql dev"
alias ttree="tree --filelimit 16 -a"
alias lss="ls -A"

alias tree="tree -C"
alias ls="${gnu_prefix}ls --color=always" # must `brew install coreutils` first
eval `${gnu_prefix}dircolors $HOME/.dir_colors` # for ls colors
export TERM="screen-256color" # needed for tmux colors

export TZ=UTC
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR=vim
export AWS_DEFAULT_REGION=us-east-1

export PATH=/usr/bin:/bin:/usr/sbin:/sbin
export PATH=/usr/local/bin:$PATH # homebrew
export PATH=~/.rbenv/bin:$PATH # git rbenv

eval "$(rbenv init -)"

# from https://wiki.archlinux.org/index.php/Man_Page#Colored_man_pages
man() {
  env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
      LESS_TERMCAP_md=$(printf "\e[1;31m") \
      LESS_TERMCAP_me=$(printf "\e[0m") \
      LESS_TERMCAP_se=$(printf "\e[0m") \
      LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
      LESS_TERMCAP_ue=$(printf "\e[0m") \
      LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

# from brew info zsh
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# go version manager
export GVM_ROOT=$HOME/.gvm
source $GVM_ROOT/scripts/gvm-default

[[ -s $HOME/.zshrc.private ]] && source $HOME/.zshrc.private
