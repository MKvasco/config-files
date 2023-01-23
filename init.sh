#!/bin/bash

# --------Functions----------
# Dotfiles cleanup function
cleanup () {
  source $HOME/.dotfiles/scripts/cleanup.sh &
  wait
}
# Log function
log () {
  echo $1; sleep 1
}


# Brew installation
log "Begin brew formulae installation!"
source $HOME/.dotfiles/scripts/install.sh &
log "Brew installaction completed!" 

# Oh-my-zsh installation
log "Begin oh-my-zsh installation!"
cleanup
rm $HOME/.dotfiles/install.sh
rm -r $HOME/.oh-my-zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
ZSH="$HOME/.oh-my-zsh" sh install.sh &
wait
rm $HOME/.oh-my-zsh/themes/gnzh.zsh-theme 
cp $HOME/.dotfiles/custom/themes/gnzh.zsh-theme $HOME/.oh-my-zsh/themes/gnzh.zsh-theme
rm $HOME/.dotfiles/install.sh
log "Oh-my_zsh installation completed!"

# Oh-my-zsh custom plugins installation
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Create symlinks for dotfiles
log "Creating symlinks!"
cleanup
ln -s $HOME/.dotfiles/zsh/.zshrc $HOME/.zshrc
# Create symlink for ideavim
ln -s $HOME/.dotfiles/nvim/ideavim.vim $HOME/.ideavimrc
log "All symlink successfully created!"

# Zsh configs
log "Applying zsh configs!"
source $HOME/.zshrc
log "Zsh configs applied!"
