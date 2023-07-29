#!/usr/bin/env zsh

emacs_path=$HOME/.emacs.d

if [ ! -d $emacs_path ]; then
	echo 'Spacemacs not installed. Installing.'
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
fi
