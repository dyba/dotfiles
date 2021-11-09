#!/usr/bin/env zsh

# Applies symlinks using stow
DOTFILES_DIR=$HOME/.dotfiles

[ ! -d $DOTFILES_DIR ] && echo 'Directory .dotfiles does not exist. Clone from https://github.com/dyba/dotfiles' && exit 1

declare -a PACKAGE_DIRS
PACKAGE_DIRS=(
    "ruby"
    "haskell"
    "kitty"
    "zsh"
    "tmux"
    "git"
)
declare -r PACKAGE_DIRS

for package in $PACKAGE_DIRS; do
    stow -v --restow --target=$HOME --dir=$DOTFILES_DIR $package
done

stow -v --restow --target=$HOME --dir=$DOTFILES_DIR --ignore='.*\.(zsh|md)' spacemacs
