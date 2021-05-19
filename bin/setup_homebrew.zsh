#!/usr/bin/env zsh

function install_homebrew() {
    if ! command -v brew &> /dev/null; then
        echo "Homebrew not found. Installing..."
        arch_name="$(uname -m)"

        if [ "${arch_name}" = "x86_64" ]; then
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        elif [ "${arch_name}" = "arm64" ]; then
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
    else
        echo "Homebrew already installed."
    fi
}

install_homebrew

brew cask install alacritty

brew tap homebrew/cask-fonts
brew cask install font-fira-code

declare -a FORMULAS
FORMULAS=(
    # Stow helps manage dotfiles
    "stow"

    # For tmux support
    "tmux"
    "reattach-to-user-namespace"

    # For python
    "yapf"

    "exa" # Replacement for ls
    "bat" # View code files using cat, but with syntax highlighting

    # For cloud infrastructure
    "terraform"

    "fd"
    "git-delta"
    "fzf"
    "git-gui"

    "pg_formatter"
    "pgcli"
)
declare -r FORMULAS

for formula in $FORMULAS; do
    if ! command -v stow &> /dev/null; then
        echo "Installing ${formula}..."
        brew install $formula
    else
        echo "${formula} already installed."
    fi
done
