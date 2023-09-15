# System
alias more='less'
alias folders='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'
alias mkdir='mkdir -pv'
alias c='clear'
alias cls='clear'
alias copy='cp'
alias rename='mv'
alias del='rm'
alias aptget='apt-get'
alias rm='rm -I'
alias rmrf='rm -rf'

alias ..='cd ..'
alias s='cd ..'

alias work="tmux source-file '${HOME}/.config/tmux/sessions-work.tmux'"

[ "$(command -v nvim)" ] && alias vim="nvim"
alias vi="vim"
alias v="vim"

[ "$(command -v exa)" ] && alias ls='exa --icons'
alias ll='ls -l'
alias lla='ll -a'
alias llh='ll -h'
alias llm='ll | \more'
alias lll='ll | \less'
alias llr='ll -R'
alias la='ls -A'
alias l='ls -CF'
alias l.='ls -d .* --color=auto'

[ "$(command -v htop)" ] && alias top='htop'
alias diskspace='du -S | sort -n -r | more'
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

# Date
[ "$(command -v gdate)" ] && alias date='gdate'
alias now='date +"%T'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'

# Git
alias push='git push -v'
alias checkout='git checkout'
alias gpp="git pull --ff --tags --progress --prune"
alias gfp="git fetch --tags --progress --prune --prune-tags"

# GnuPG
alias gpg-sym='gpg --armor --symmetric --cipher-algo AES256'
alias gpg-sym-sign='gpg-sym --sign'
alias gpg-pass='gpg-sym'
alias gpg-password='gpg-sym'
alias gpgcard-refresh="gpgconf --kill gpg-agent; killall pintentry-*; pkill gpg-agent; gpg-connect-agent reloadagent /bye; echo 'Waiting for service 10s...'; sleep 10; gpg --card-status;"
alias gpg-card-refresh="gpgcard-refresh"

# Kubernetes
alias k='kubectl'
alias kc='kubectl config view --minify | grep name'
alias kdp='kubectl describe pod'
alias krh='kubectl run --help | more'
alias ugh='kubectl get --help | more'
alias kd='kubectl describe pod'
alias ke='kubectl explain'
alias kf='kubectl create -f'
alias kg='kubectl get pods --show-labels'
alias kr='kubectl replace -f'
alias kh='kubectl --help | more'
alias krh='kubectl run --help | more'
alias ks='kubectl get namespaces'
alias kga='kubectl get pod --all-namespaces'
alias kgaa='kubectl get all --show-labels'

# .my.* files
alias my-docker-compose="docker compose -f .my.docker-compose.yml"
alias my-make="make --makefile=.my.Makefile"

# Network
alias ping='ping -c 5'
alias pingfast='ping -c 100 -s.2'
alias ports='netstat -tulanp'
alias wget='wget -c'

# Tools
alias artisan='php artisan'
alias bashly='docker run --rm -it --user $(id -u):$(id -g) --volume "$PWD:/app" dannyben/bashly'
[ "$(command -v semver)" ] || alias semver='docker run --rm -it --platform linux/amd64 ffurrer/semver'

alias zshconfig="${EDITOR} ${ZDOTDIR:-$HOME}/.zshrc && exec zsh"
alias ohmyzsh="${EDITOR} ${ZDOTDIR:-$HOME}/.oh-my-zsh && exec zsh"

# Other
alias please='sudo'
alias comeon='sudo $(history -p !!)'
alias sob='ll'
alias het='ll'
alias chfama='ll'
alias lista='ll'
alias damn='echo "Relax, man!"'

alias clean_keyboard_0='sudo xinput float 21; for icounter in {30..1}; do echo "Seconds left: $icounter"; sleep 1s; done; sudo xinput reattach 21 3;';
alias clean_keyboard_1='sudo xinput float 17; for icounter in {30..1}; do echo "Seconds left: $icounter"; sleep 1s; done; sudo xinput reattach 17 3;';

alias mouse_random='until false; do cliclick -e 10 m:$((RANDOM%3072)),$((RANDOM%1920)); sleep 5; done;'
