# Path to your oh-my-zsh installation.
export ZSH="$HOME/.dotfiles/.oh-my-zsh"
# Path to default config and data direcotries
export XDG_CONFIG_HOME=$HOME/.dotfiles/config
export XDG_DATA_HOME=$HOME/.dotfiles/data
# PostgreSQL defaults 
export PGDATABASE=postgres
export PGUSER=postgres
# Path to node version manager directory
export NVM_DIR="$HOME/.dotfiles/.nvm"
# This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  
# This loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
