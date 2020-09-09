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
  git
  kubectl
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.dotfiles/zsh/asdf.zsh
source $HOME/.dotfiles/zsh/scmpuff.zsh
source $HOME/.dotfiles/zsh/fzf-tab.zsh
source $HOME/.dotfiles/zsh/git.zsh
source $HOME/.dotfiles/zsh/websites.zsh
source $HOME/.dotfiles/zsh/tpm.zsh

# Customize to your needs...

[ -x "$(command -v rbenv)" ] && eval "$(rbenv init -)"
[ -x "$(command -v jenv)" ] && eval "$(jenv init -)"
[ -x "$(command -v exenv)" ] && eval "$(exenv init -)"

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
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

USER_BASE_PATH=$(python -m site --user-base)
export PATH=$PATH:$USER_BASE_PATH/bin

export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# if [ -d "$HOME/Tools/google-cloud-sdk" ]; then
#     export PATH=$PATH:$HOME/Tools/google-cloud-sdk/bin
# fi

if [ -d "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk" ]; then
  . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  . "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
fi

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
__conda_setup="$('/usr/local/var/pyenv/versions/miniconda3-4.3.30/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/var/pyenv/versions/miniconda3-4.3.30/etc/profile.d/conda.sh" ]; then
        . "/usr/local/var/pyenv/versions/miniconda3-4.3.30/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/var/pyenv/versions/miniconda3-4.3.30/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/opt/curl/bin:$PATH"


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

# Aliases for Work
[[ $(scutil --get LocalHostName) == 'Daniels-MacBook-Pro-6' ]] && source $HOME/.dotfiles/zsh/work-aliases.zsh

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
