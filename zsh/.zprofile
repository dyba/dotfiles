# export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/bin:$PATH"

# export ANDROID_HOME=$HOME/Development/android-sdk-macosx
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/platform-tools

# [ -x "$(command -v pyenv)" ] && eval "$(pyenv init -)"
# [ -x "$(command -v pyenv-virtualenv-init)" ] && eval "$(pyenv virtualenv-init -)"

# export PATH="$HOME/.cargo/bin:$PATH"

arch_name="$(uname -m)"

if [ "${arch_name}" = "arm64" ]; then
    # Running on the Homebrew eval script on ARM
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ "${arch_name}" = "x86_64"]; then
    # Running on x86_64 architecture
else
    echo "Unknown architecture: ${arch_name}"
fi
