#!/usr/bin/env zsh

KITTY_THEME=Solarized_Light.conf

if [ ! -d ~/.config/kitty/kitty-themes ]; then
	git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
fi

cd ~/.config/kitty
ln -sf ./kitty-themes/themes/$KITTY_THEME ~/.config/kitty/theme.conf
