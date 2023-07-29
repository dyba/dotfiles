#!/usr/bin/env zsh

TPM_PLUGIN_DIR=~/.tmux/plugins/tpm

if [ ! -d $TPM_PLUGIN_DIR ]; then
    echo "tpm not found. Cloning into $TPM_PLUGIN_DIR"
    git clone https://github.com/tmux-plugins/tpm $TPM_PLUGIN_DIR
fi
