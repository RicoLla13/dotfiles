if [[ -z $ZSH_THEME_CLOUD_PREFIX ]]; then
    ZSH_THEME_CLOUD_PREFIX='☁'
fi

PROMPT='%(?:%{$fg_bold[cyan]%}%1{$ZSH_THEME_CLOUD_PREFIX%}%{$reset_color%} :%{$fg_bold[red]%}%1{$ZSH_THEME_CLOUD_PREFIX%}%{$reset_color%}) %(?::%{$fg[red]%}[%?]%{$reset_color%}) %{$fg_bold[green]%}%c %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}[%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}] %{$fg[yellow]%}⚡ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%}]"
