#!/bin/zsh

if [ ! -x "$(command -v scmpuff)" ]; then
    echo "scmpuff not found. Installing with brew..."
    brew install scmpuff
fi

eval "$(scmpuff init -s)"
