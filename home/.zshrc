# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

#ZSH_THEME="random"
ZSH_THEME="tjkirch"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim  ~/.oh-my-zsh"

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

export PATH=/usr/local/bin:/usr/bin:/bin		# regular binaries
export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin	# secure binaries

export EDITOR=vim

# per homebrew instructions
#unalias run-help					# not applicable?
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

# rbenv
eval "$(rbenv init -)"
