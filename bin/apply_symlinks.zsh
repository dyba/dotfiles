#!/usr/bin/env zsh

# Applies symlinks using stow

[[ -d $HOME/.dotfiles ]] && DOTFILES_DIR=$HOME/.dotfiles

stow -v --restow --target=$HOME --dir=$DOTFILES_DIR ruby
