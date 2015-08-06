# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# The editor to use when opening a bundled gem
export BUNDLER_EDITOR='mvim'

# Add .rbenv to your PATH
export PATH=$HOME/.rbenv/bin:$PATH
export PATH=$HOME/bin:$PATH

# Add Postgres app
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# export PATH=$HOME/bin/AWS-ElasticBeanstalk-CLI-2.6.0/eb/macosx/python2.7:$PATH # Fix to check for python3

# Enable shims and autocompletion
eval "$(rbenv init -)"

# Aliases
alias rake="noglob bundled_rake" # This is a workaround with rake when using Zsh: https://github.com/robbyrussell/oh-my-zsh/issues/433
alias prettify_json="json_reformat" # Run 'brew install yajl' to get the `json_reformat` command
alias mou="open /Applications/Mou.app"

# OPAM configuration
. /Users/ddyba/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Go configuration
export GOPATH=$HOME/Code/go
export PATH=$PATH:$GOPATH/bin

# Aliases
alias rake="noglob bundled_rake" # This is a workaround with rake when using Zsh: https://github.com/robbyrussell/oh-my-zsh/issues/433
alias prettify_json="json_reformat" # Run 'brew install yajl' to get the `json_reformat` command

# added by travis gem
[ -f /Users/ddyba/.travis/travis.sh ] && source /Users/ddyba/.travis/travis.sh

# Eiffel configuration
export ISE_EIFFEL=/Users/ddyba/Downloads/Eiffel_14.05
export ISE_PLATFORM=macosx-x86-64

# Enable Zsh completion for AWS
source /usr/local/share/zsh/site-functions/_aws

# Start tmux automatically
[[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
