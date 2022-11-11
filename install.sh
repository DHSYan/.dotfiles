#!/bin/bash


rm -r ~/.zshrc && 
rm -r ~/.gitconfig &&
rm -r ~/.config/nvim && 
rm -r ~/.tmux.conf &&

ln -s ~/.dotfiles/.zshrc ~/.zshrc && 
ln -s ~/.dotfiles/..gitconfig ~/.gitconfig &&
ln -s ~/.dotfiles/nvim ~/.config/nvim	 && 
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf 
&& echo "Done"
