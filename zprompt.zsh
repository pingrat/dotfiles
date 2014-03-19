# unset a few possibly dirty variables
unset PROMPT RPROMPT prompt rprompt

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}»%{$reset_color%} %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ⎇%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local gitprompt='$(git_prompt_info)'

prompt="
%{$fg[red]%}--%{$reset_color%}
%{$fg[red]%}»%{$reset_color%} %{$fg[cyan]%}%d%{$reset_color%} ${gitprompt}
%{$fg[red]%}$%{$reset_color%} "

unset gitprompt
