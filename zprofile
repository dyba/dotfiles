export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

if command -v pyenv 1> /dev/null 2>&1; then
    eval "$(pyenv init -)"
else
    echo "The command pyenv is not available"
fi

if command -v pyenv-virtualenv-init 1> /dev/null 2>&1; then
    eval "$(pyenv virtualenv-init -)"
else
    echo "The command pyenv-virtualenv-init is not available"
fi
