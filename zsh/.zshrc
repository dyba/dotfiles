# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="powerlevel10k/powerlevel10k"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Aliases
alias rb="bundle exec ruby"

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
plugins=(
  kubectl
  zsh-autosuggestions
  asdf
)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# The editor to use when opening a bundled gem
export BUNDLER_EDITOR='mvim'

# Set up rbenv
# export PATH=$PATH:$HOME/.rbenv/bin

# Set up jenv
export JENV_ROOT=/usr/local/var/jenv

# Set up exenv
export EXENV_ROOT=/usr/local/var/exenv

# Add .NET CLI path
# export PATH=/usr/local/share/dotnet:$PATH

# Set Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Java variables
export JAVA_HOME=$(/usr/libexec/java_home)

# Eiffel configuration
export ISE_EIFFEL=/Users/ddyba/Downloads/Eiffel_14.05
export ISE_PLATFORM=macosx-x86-64

export EDITOR="vim"

# nvm variables
export NVM_DIR=~/.nvm

# AWS environment variables
export AWS_PROFILE=default
export AWS_DEFAULT_PROFILE=default

# Aliases
alias prettify_json="json_reformat" # Run 'brew install yajl' to get the `json_reformat` command
alias mdown="open -a /Applications/MacDown.app"

# OPAM configuration
. /Users/ddyba/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Aliases

# added by travis gem
[ -f /Users/ddyba/.travis/travis.sh ] && source /Users/ddyba/.travis/travis.sh

# Enable Zsh completion for AWS
# source /usr/local/share/zsh/site-functions/_aws

# Start tmux automatically
# [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux

# NVM Configuration
[ -x "$(command -v nvm)" ] && . "/usr/local/opt/nvm/nvm.sh"

# Enable command completion for awscli
source /usr/local/share/zsh/site-functions/_aws

# Enable powerline daemon
# . /Users/ddyba/.local/lib/python3.5/site-packages/powerline/bindings/zsh/powerline.zsh

#alias emacs="/usr/local/Cellar/emacs/25.1/Emacs.app/Contents/MacOS/Emacs -nw"

# FIXME: Move this outside of .zshrc
#
# LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
# if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
#   . $LUNCHY_DIR/lunchy-completion.zsh
# fi
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# USER_BASE_PATH=$(python -m site --user-base)
# export PATH=$PATH:$USER_BASE_PATH/bin

# if [ -d "$HOME/Tools/google-cloud-sdk" ]; then
#     export PATH=$PATH:$HOME/Tools/google-cloud-sdk/bin
# fi

# When running tmux in a shell, tmux will reload the .zshrc file and effectively load any path modifications twice
#
# See: https://stackoverflow.com/questions/13058578/how-to-prevent-tmux-from-filling-up-the-global-path-variable-with-duplicated-pat/13060475
# If we're not already inside a TMUX session
if [[ -z $TMUX ]]; then
	# NOTE: Unused as of 2021-02-10
	export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH

	# NOTE: Unused as of 2021-02-10
	export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

	# NOTE: Unused as of 2021-02-10
	if [ -d "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk" ]; then
		. "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
		. "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
	fi

	# Installed Haskell scripts get dumped here by cabal
	# NOTE: Unused since 2021-02-10
	export PATH=$HOME/.cabal/bin:$PATH

	# NOTE: Unused as of 2012-02-10
	export PATH="/usr/local/opt/qt/bin:$PATH"

	# NOTE: Unvetted since 2021-02-10
	# It's likely this was needed at some point for Ruby
	export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

	# Use Homebrew's version of curl and not the system default
	export PATH="/usr/local/opt/curl/bin:$PATH"

	# Golang configuration
	export GOPATH=$HOME/Code/go
	export PATH="$GOPATH/bin:$PATH"

	# NOTE: Unvetted since 2021-02-12
	# Set up pyenv
	export PYENV_ROOT=/usr/local/var/pyenv
	export PATH="$PYENV_ROOT/bin:$PATH"

	# My scripts
	export PATH="$HOME/.scripts/bin:$PATH"
fi

source $HOME/.dotfiles/scripts/zsh/scmpuff.zsh
source $HOME/.dotfiles/scripts/zsh/fzf-tab.zsh
source $HOME/.dotfiles/scripts/zsh/git.zsh
source $HOME/.dotfiles/scripts/zsh/websites.zsh
source $HOME/.dotfiles/scripts/zsh/tpm.zsh
source $HOME/.dotfiles/scripts/zsh/functions.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/ddyba/.asdf/installs/nodejs/10.16.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/ddyba/.asdf/installs/nodejs/10.16.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/ddyba/.asdf/installs/nodejs/10.16.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/ddyba/.asdf/installs/nodejs/10.16.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/ddyba/.asdf/installs/nodejs/10.16.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/ddyba/.asdf/installs/nodejs/10.16.0/.npm/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/usr/local/var/pyenv/versions/miniconda3-4.3.30/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/usr/local/var/pyenv/versions/miniconda3-4.3.30/etc/profile.d/conda.sh" ]; then
#         . "/usr/local/var/pyenv/versions/miniconda3-4.3.30/etc/profile.d/conda.sh"
#     else
#         export PATH="/usr/local/var/pyenv/versions/miniconda3-4.3.30/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# NOTE: Unvetted since 2021-02-10
export SDKMAN_DIR="/Users/ddyba/.sdkman"
[[ -s "/Users/ddyba/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/ddyba/.sdkman/bin/sdkman-init.sh"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Aliases for Work
[[ $(scutil --get LocalHostName) == 'Daniels-MacBook-Pro-6' ]] && source $HOME/.dotfiles/zsh/work-aliases.zsh

# completion for kitty
if command -v kitty &> /dev/null
then
	kitty + complete setup zsh | source /dev/stdin
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
