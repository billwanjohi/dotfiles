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

alias ls="gls --color=auto"
eval `gdircolors $HOME/.dir_colors` # for ls colors
export TERM="screen-256color" # needed for tmux colors

export PATH=/usr/local/bin:/usr/bin:/bin # regular binaries
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin # secure binaries
export EDITOR=vim

# per homebrew instructions for zsh
#unalias run-help # not applicable?
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# rbenv
eval "$(rbenv init -)"

source ~/.private
