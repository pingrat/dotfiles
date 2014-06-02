
# unset a few possibly dirty variables
unset PROMPT RPROMPT prompt rprompt

local _TEXT_EXIT_CODE_COLOR='%{[38;5;052m%}'
local _TEXT_DECORATIVE_COLOR='%{[38;5;066m%}'
local _TEXT_GUTTER_COLOR='%{[38;5;234m%}'
local _TEXT_USERNAME_NORMAL_COLOR='%{[38;5;246m%}'
local _TEXT_USERNAME_ROOT_COLOR='%{[38;5;191m%}'
local _TEXT_HOST_COLOR='%{[38;5;246m%}'
local _TEXT_GITREPO_COLOR='%{[38;5;246m%}'
local _TEXT_GITBRANCH_COLOR='%{[38;5;191m%}'
local _TEXT_WORKDIR_COLOR='%{[38;5;111m%}'
local _TEXT_PROMPT_COLOR='%{[38;5;065m%}'
local _TEXT_RESET_COLOR='%{[0;0m%}'

disco_version() {
  node --version 2>/dev/null | awk '{print $1}'
}

git_repo() {
	# this prints only the last part of remote.origin.url
	echo -n $(git config --local --get remote.origin.url|grep -o --color=never '[^\/]*$')
	# this prints the entire remote url
	#echo -n $(git config --local --get remote.origin.url)
}

git_branch() {
	ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
	ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
	echo -n "${ref#refs/heads/}"
}

# perdy git repo info
ZSH_THEME_GIT_PROMPT_PREFIX="$_TEXT_GUTTER_COLOR:$_TEXT_GITBRANCH_COLOR"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# 2014-05-30: added emojis to terminal prompt,
#   we have now reached ludicrous levels of shell geekery!
ZSH_THEME_GIT_PROMPT_DIRTY="$_TEXT_RESET_COLOR 😱 "
ZSH_THEME_GIT_PROMPT_CLEAN="$_TEXT_RESET_COLOR 😊 "
ZSH_THEME_GIT_PROMPT_UNTRACKED="❔ "
ZSH_THEME_GIT_PROMPT_ADDED="🌟 "
ZSH_THEME_GIT_PROMPT_MODIFIED="📝 "
ZSH_THEME_GIT_PROMPT_RENAMED="⏩ "
ZSH_THEME_GIT_PROMPT_DELETED="❌ "
ZSH_THEME_GIT_PROMPT_UNMERGED="🔃 "

local return_code="%(?..$_TEXT_EXIT_CODE_COLOR^- exit %?)"
local git_info='$(git_repo)$(git_prompt_info) $(git_prompt_status)'

prompt="
${return_code}

$_TEXT_DECORATIVE_COLOR--
$_TEXT_DECORATIVE_COLOR»$_TEXT_GUTTER_COLOR\
 %(!.$_TEXT_USERNAME_ROOT_COLOR.$_TEXT_USERNAME_NORMAL_COLOR)%n$_TEXT_GUTTER_COLOR@$_TEXT_HOST_COLOR%M:$_TEXT_WORKDIR_COLOR%10<..<%~\
 $_TEXT_GITREPO_COLOR${git_info}
$_TEXT_DECORATIVE_COLOR$ $_TEXT_PROMPT_COLOR"

preexec () {
	echo "[38;5;066m--[0;0m\n"
}

unset _TEXT_DECORATIVE_COLOR _TEXT_GUTTER_COLOR _TEXT_USERNAME_NORMAL_COLOR _TEXT_USERNAME_ROOT_COLOR _TEXT_HOST_COLOR _TEXT_GITREPO_COLOR _TEXT_GITBRANCH_COLOR _TEXT_WORKDIR_COLOR _TEXT_PROMPT_COLOR _TEXT_RESET_COLOR
unset gitinfo
