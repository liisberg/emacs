# aliases for easier cli
if [ "$TERM" == "xterm" ]; then
    export TERM=xterm-256color
fi
# make theese aliases available when sudo'ing too.
alias sudo="sudo "
# cli convienience
alias ..='cd ..'
alias cd..='cd ..'
alias c='clear'
alias mkdir='mkdir -pv' # make parent dirs, and be verbose about it.
# nicer directory listings, all files by default - with colors all around
alias ls='ls --color=auto -a'
alias ll='ls --color=auto -alF'
alias l='ls'
# Too much time spent on FreeBSD to forget theese!
alias h='history'
alias j='jobs -l'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cgrep="grep '^[[:blank:]]*[^[:blank:]#;]'"
# networking utils
alias fastping='ping -c 100 -s.2'
alias ports='netstat -tulanp'      # show all tcp & udp ports on the server
alias header='curl -I'             # get web server headers
alias headerc='curl -I --compress' # for compression using gzip
# Easy maintenance etc.
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'  # get top process eating memory
alias pscpu='ps auxf | sort -nr -k 3'  # get top process eating cpu
alias cpuinfo='lscpu'                  # Get server cpu info
# Get mem info for GPU (useable for Workstations mostly)
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
# Fixes for ubuntu - make the cli feel more like home.
alias su='sudo -i' #There fixed it!
# make emacs stay in the cli, when invoked from the cli.
alias emacs='emacsclient -t -a ""'
# if user is not root, pass all commands via sudo #
# yes, i freaking hate sudo, and i always forget with apt-get.
if [ $UID -ne 0 ]; then
    alias apt-get='sudo apt-get'
    alias reboot='sudo reboot'
    alias update='sudo apt-get upgrade'
fi
#PS1='\u@\h:\w$ '
#alias docker='sudo docker'
#alias docker-compose='sudo docker-compose'
#alias docker-cleanup='sudo docker-cleanup'-
alias dockrm='docker rm $(docker ps -a -q)'
alias dockrmi='docker rmi $(docker images -q)'
alias ansible_playbook='ansible-playbook -u ansible -i hosts --ask-pass --ask-become-pass'
