#!/usr/bin/env zsh

# Applies symlinks using stow

[[ -d $HOME/.dotfiles ]] && DOTFILES_DIR=$HOME/.dotfiles

declare -a PACKAGE_DIRS
PACKAGE_DIRS=(
    "ruby"
    "kitty"
    "zsh"
    "tmux"
    "git"
)
declare -r PACKAGE_DIRS

for package in $PACKAGE_DIRS; do
    stow -v --restow --target=$HOME --dir=$DOTFILES_DIR $package
done
