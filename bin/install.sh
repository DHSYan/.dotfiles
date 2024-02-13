#!/bin/bash


rm -rf ~/.config/nvim && 

rm -rf ~/.zshrc && 
rm -rf ~/.zsh_profile &&
# rm -rf ~/.oh-my-zsh &&

rm -rf ~/.gitconfig &&

rm -rf ~/.tmux.conf &&


ln -s ~/.dotfiles/nvim ~/.config/nvim	 && 

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc && 
ln -s ~/.dotfiles/zsh/.zsh_profile ~/.zsh_profile && 
# ln -s ~/.dotfiles/zsh/.oh-my-zsh/ ~/.oh-my-zsh

ln -s ~/.dotfiles/Git/.gitconfig ~/.gitconfig &&


ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf &&
# ln -s ~/.dotfiles/bin/ ~/bin &&


echo "Done"
