#!/usr/bin/env zsh

# Applies symlinks using stow

[[ -d $HOME/.dotfiles ]] && DOTFILES_DIR=$HOME/.dotfiles

stow -v --restow --target=$HOME --dir=$DOTFILES_DIR ruby
stow -v --restow --target=$HOME --dir=$DOTFILES_DIR kitty
stow -v --restow --target=$HOME --dir=$DOTFILES_DIR zsh
stow -v --restow --target=$HOME --dir=$DOTFILES_DIR tmux
stow -v --restow --target=$HOME --dir=$DOTFILES_DIR git
