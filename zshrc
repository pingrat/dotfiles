ZSH=/Users/pingrat/.oh-my-zsh
ZSH_THEME="evan"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git git-prompt)

. $ZSH/oh-my-zsh.sh

. $HOME/.aliases.zsh
. $HOME/.zprompt.zsh

# User configuration

export PATH="$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
