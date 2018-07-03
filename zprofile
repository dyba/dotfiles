export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export ANDROID_HOME=$HOME/Development/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

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

export PATH="$HOME/.cargo/bin:$PATH"
