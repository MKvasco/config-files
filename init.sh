#!/bin/bash

# --------Functions----------
# Dotfiles cleanup function
cleanup () {
  source $HOME/.dotfiles/scripts/cleanup.sh &
  wait
}

# Brew installation
echo "Begin brew formulae installation!"
sleep 1
source $HOME/.dotfiles/scripts/install.sh &
wait
echo "Brew installaction completed!"
sleep 1

# Oh-my-zsh installation
echo "Begin oh-my-zsh installation!"
sleep 1
cleanup
rm -r $HOME/.dotfiles/.oh-my-zsh
rm $HOME/.dotfiles/install.sh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
ZSH="$HOME/.dotfiles/.oh-my-zsh" sh install.sh &
wait
rm $HOME/.dotfiles/.oh-my-zsh/themes/gnzh.zsh-theme 
cp $HOME/.dotfiles/custom-themes/oh-my-zsh/gnzh.zsh-theme $HOME/.dotfiles/.oh-my-zsh/themes/gnzh.zsh-theme
rm $HOME/.dotfiles/install.sh
echo "Oh-my_zsh installation completed!"
sleep 1

# Create symlinks for dotfiles
echo "Creating symlinks!"
sleep 1 
cleanup
ln -s $HOME/.dotfiles/.zsh/.zshrc $HOME/.zshrc
echo "All symlink successfully created!"
sleep 1

# Zsh configs
echo "Applying zsh configs!"
sleep 1
source $HOME/.zshrc
echo "Zsh configs applied!"
sleep 1
