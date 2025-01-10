# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cloud2"
plugins=(git zsh-autosuggestions sudo)

source $ZSH/oh-my-zsh.sh

# User added
# Add scripts folder to path
export PATH=$PATH:$HOME/dev/scripts
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
# PATH for Qt
export PATH=$PATH:$HOME/Qt/Tools/QtCreator/bin
export PATH=$PATH:$HOME/Qt/6.5.3/gcc_64/bin
export PATH=$PATH:$HOME/Qt/Tools/CMake/bin
export LG_LIBRARY_PATH=$HOME/Qt/6.5.3/gcc_64/lib:$LD_LIBRARY_PATH

# PATH for flutter and Android vars
export ANDROID_HOME=$HOME/dev/dev_envs/android-sdk
export PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/emulator"
export PATH=$HOME/dev/dev_envs/flutter/bin:$PATH
export PUB_CACHE=$HOME/.pub-cache
# neofetch
macchina
# Update checker
$HOME/dev/scripts/update_reminder.sh

# Aliases
alias sail='./vendor/bin/sail'
alias saila='sail artisan'
alias v='nvim'
alias cd='z'
alias cdu='cd ..'
alias new='touch'
alias venv_a='source .venv/bin/activate'
alias n-test='XDG_CONFIG_HOME=~/.config/nvim-test nvim'
alias k=kubectl
alias wmpv='webtorrent --mpv'
alias ths=toggle_history_save
# Git Aliases
alias gst='git status'
alias gaa='git add .'
alias gcm='git commit -m'
alias gpsh='git push'

# Locales
export LC_ALL=en_US.UTF-8

# Default editor
export EDITOR=nvim

# Zoxide
eval "$(zoxide init zsh)"
# Fuzzy finder
eval "$(fzf --zsh)"

# Toggle saving history to file
toggle_history_save() {
    if [[ -z "$HISTFILE" ]]; then
        export HISTFILE=$HOME/.zsh_history
        export HISTSIZE=1000
        export SAVEHIST=1000
        echo "History saving ENABLED."
    else
        unset HISTFILE
        export HISTSIZE=0
        export SAVEHIST=0
        echo "History saving DISABLED."
    fi
}
