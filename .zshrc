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
# neofetch
macchina

# Aliases
alias sail='./vendor/bin/sail'
alias saila='sail artisan'
alias v='nvim'
alias cd='z'
alias cdu='cd ..'
alias new='touch'
alias venv_a='source .venv/bin/activate'
alias n-test='XDG_CONFIG_HOME=~/.config/nvim-test nvim'

# Locales
export LC_ALL=en_US.UTF-8

# Default editor
export EDITOR=nvim

# Zoxide
eval "$(zoxide init zsh)"
# Fuzzy finder
eval "$(fzf --zsh)"
