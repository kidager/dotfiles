alias hibernate='systemctl hibernate'
# if user is not root, pass all these commands via sudo #
if [ $UID -ne 0 ]; then
  alias reboot='sudo /sbin/reboot'
  alias poweroff='sudo /sbin/poweroff'
  alias halt='sudo /sbin/halt'
  alias shutdown='sudo /sbin/shutdown'
  alias hibernate='sudo systemctl hibernate'
  alias apt-get='sudo apt-get'
  alias apt='sudo apt'
fi

# Make life easier
alias aptget='apt-get'
alias rm='rm -I'
alias rmrf='rm -rf'

# some more ls aliases
alias diskspace='du -S | sort -n -r | more'
alias folders='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'
alias mkdir='mkdir -pv'
alias c='clear'
alias cls='clear'
alias copy='cp'
alias rename='mv'
alias del='rm'
alias install='apt-get install'

alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%Y-%m-%d"'
alias nowdatetime='date +"%Y-%m-%d %T"'

alias ping='ping -c 5'
alias pingfast='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias wget='wget -c'
alias top='htop'

alias meminfo='free -m -l -t'
alias cpuinfo='lscpu'
alias cpuinfoold='less /proc/cpuinfo'
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

alias more='less'

alias ll='ls -l'
alias lla='ll -a'
alias llh='ll -h'
alias llm='ll | \more'
alias lll='ll | \less'
alias llr='ll -R'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'

alias artisan='php artisan'
alias ..='cd ..'
alias s='cd ..'
alias please='sudo'
alias comeon='sudo $(history -p !!)'
alias damn='echo "Relax, man!"'

alias sudo='sudo '

alias listen="sudo lsof -i -P -n | grep LISTEN | grep"
