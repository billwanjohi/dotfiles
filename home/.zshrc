# oh-my-zsh config
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="tjkirch" # or "random" for fun
CASE_SENSITIVE="false"
DISABLE_AUTO_UPDATE="false"
export UPDATE_ZSH_DAYS=13
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="false"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="false"
plugins=(git rails ruby)
source $ZSH/oh-my-zsh.sh

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim  ~/.oh-my-zsh"
alias vim="vim -p"
alias vi="vim"
alias gdc="git diff --cached"
alias gap="git add --patch"

alias ls="gls --color=auto"
eval `gdircolors $HOME/.dir_colors` # for ls colors
export TERM="screen-256color" # needed for tmux colors

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

export PATH=/usr/local/share/python # brew python
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin # regular binaries
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin # secure binaries
export EDITOR=vim

# from brew info zsh
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# virtualenvwrapper (http://virtualenvwrapper.readthedocs.org/en/latest/install.html)
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME
source /usr/local/bin/virtualenvwrapper.sh

eval "$(rbenv init -)" # rbenv

source ~/.private
