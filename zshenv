export PATH=$PATH:.scripts/bin

# The editor to use when opening a bundled gem
export BUNDLER_EDITOR='mvim'

# Set up rbenv
export PATH=$PATH:$HOME/.rbenv/bin

# Set up pyenv
export PYENV_ROOT=/usr/local/var/pyenv
export PATH="$PYENV_ROOT/bin:$PATH"

# Set up jenv
export JENV_ROOT=/usr/local/var/jenv

# Set up exenv
export EXENV_ROOT=/usr/local/var/exenv

# Add .NET CLI path
export PATH=/usr/local/share/dotnet:$PATH

# Go configuration
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

# Add Postgres app
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH

export PATH=~/.scripts/bin:$PATH

# Set Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Java variables
export JAVA_HOME=$(/usr/libexec/java_home)

# Installed Haskell scripts get dumped here by cabal
export PATH=$HOME/.cabal/bin:$PATH

# Eiffel configuration
export ISE_EIFFEL=/Users/ddyba/Downloads/Eiffel_14.05
export ISE_PLATFORM=macosx-x86-64

export EDITOR="vim"

# nvm variables
export NVM_DIR=~/.nvm

# AWS environment variables
export AWS_PROFILE=default
export AWS_DEFAULT_PROFILE=default
