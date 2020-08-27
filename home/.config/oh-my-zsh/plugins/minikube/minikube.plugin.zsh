# Autocompletion for Minikube.
#
# https://github.com/robbyrussell/oh-my-zsh/pull/6436

if [ $commands[minikube] ]; then
    source <(minikube completion zsh)
fi
