#!/bin/zsh

[ -n "$(type asdf)" ] && [ -d $HOME/.asdf ] && . $HOME/.asdf/asdf.sh
[ -n "$(type asdf)" ] && [ -d $HOME/.asdf ] && . $HOME/.asdf/completions/asdf.bash
