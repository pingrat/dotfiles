# enable aliases to be sudo’ed
alias sudo='sudo '

# i actually think this set of aliases are a waste of space. if navigating around where you spend
# the majority of your shell-fu warrants an alias to instantly descend six levels deeper into your
# directory structure you are solving the wrong problem at the wrong place. just saying.

# since everyone and their mom keep including these aliases i do too. after all, i wouldnt want
# people to think i'm not hip.

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias -g .......='../../../../../..'

# elles
alias ls="ls -lGw"
alias la="ls -laGw"

# i pee addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# enhanced whois lookups
alias whois="whois -h whois-servers.net"

# gzip-enabled curling
alias gurl='curl --compressed'

# weak number
alias week='date +%V'

# system aliases
# DANGER CLOSE!
alias mnt='mkdir -p /media/%2 && mount /dev/%1 /media/%2 && echo OK'
alias respawn='exec $SHELL -l'
