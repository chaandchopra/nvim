PROMPT="%(?:%{$fg_bold[green]%}%1{󱓞%} :%{$fg_bold[red]%}%1{󱓞%} )%{$fg[cyan]%}%~ %{$reset_color%}"
PROMPT+='$(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
NEW_LINE_FORMAT=$'\n '
PROMPT=$'\n'$PROMPT$'\n'
