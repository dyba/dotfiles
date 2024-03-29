#!/usr/bin/env zsh

function install_homebrew {
  arch_name="$(uname -m)"

  if [ "${arch_name}" = "x86_64" ]; then
    if ! command -v /usr/local/bin/brew &> /dev/null; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
      echo "Homebrew already installed on native Intel."
    fi
  elif [ "${arch_name}" = "arm64" ]; then
    if ! command -v /opt/homebrew/bin/brew &> /dev/null; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      /usr/sbin/softwareupdate --install-rosetta --agree-to-license
    else
      echo "Homebrew already installed on M1."
    fi
  else
    echo "Unsupported architecture ${arch_name}"
  fi
}

function install_brew_formula {
  readonly formula=${1:?"Must provide name of the formula"}

  arch_name="$(uname -m)"

  if [ "${arch_name}" = "x86_64" ]; then
    arch -x86_64 /usr/local/bin/brew install $formula
  elif [ "${arch_name}" = "arm64" ]; then
    arch -arm64 /opt/homebrew/bin/brew install $formula
  fi
}

function install_brew_x86_formula {
  readonly formula=${1:?"Must provide name of the formula"}

  arch -x86_64 /usr/local/bin/brew install $formula
}

function is_brew_installed {
  readonly formula=${1:?"Must provide name of the formula"}

  arch_name="$(uname -m)"

  if [ "${arch_name}" = "x86_64" ]; then
    arch -x86_64 /usr/local/bin/brew list -1 | sed -E '/^=$/,//d' | grep $formula
  elif [ "${arch_name}" = "arm64" ]; then
    arch -arm64 /opt/homebrew/bin/brew list -1 | sed -E '/^=$/,//d' | grep $formula
  fi
}

function is_brew_x86_installed {
  readonly formula=${1:?"Must provide name of the formula"}

  arch -x86_64 /usr/local/bin/brew list -1 | sed -E '/^=$/,//d' | grep $formula
}

install_homebrew

brew tap homebrew/cask-fonts
brew tap d12frosted/emacs-plus

declare -a FORMULAS
FORMULAS=(
  "alacritty"

  "awscli"

  "asdf"

  "font-fira-code"
  "font-source-code-pro"

  # Stow helps manage dotfiles
  "stow"

  # For tmux support
  "tmux"
  "reattach-to-user-namespace"

  # For python
  "yapf"

  # For an up-to-date pager
  "less"

  "exa" # Replacement for ls
  "bat" # View code files using cat, but with syntax highlighting

  # For cloud infrastructure
  "terraform"

  "fd"
  "git-delta"
  "fzf"
  "git-gui"

  "pgformatter"
  "pgcli"

  "kitty"

  "macvim"
  "macdown"

  "emacs-plus"

  # Used with spacemacs
  "golangci-lint"

  "gpg-suite"

  "graphviz"
)
declare -r FORMULAS

for formula in $FORMULAS; do
  is_brew_installed $formula &> /dev/null
  if [ $? -eq 0 ]; then
    echo "${formula} already installed."
  else
    echo "Installing ${formula}..."
    install_brew_formula $formula
  fi
done

declare -a X86_FORMULAS
X86_FORMULAS=(
  autoconf
  automake
  coreutils
  gpg
  jemalloc
  libffi
  libtool
  libxslt
  libyaml
  openssl
  readline
  sqlite3
  unixodbc
  vault
  xz
)
declare -r X86_FORMULAS

for formula in $X86_FORMULAS; do
  is_brew_x86_installed $formula &> /dev/null
  if [ $? -eq 0 ]; then
    echo "${formula} already installed."
  else
    echo "Installing ${formula}..."
    install_brew_x86_formula $formula
  fi
done
