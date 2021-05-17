#!/bin/zsh

if [ ! -d $ZSH_CUSTOM/plugins/fzf-tab ]; then
    echo "Zsh plugin fzf-tab not found. Cloning into '$ZSH_CUSTOM/plugins'"
    git clone https://github.com/Aloxaf/fzf-tab ~$ZSH_CUSTOM/plugins/fzf-tab
fi

source $ZSH_CUSTOM/plugins/fzf-tab/fzf-tab.plugin.zsh
