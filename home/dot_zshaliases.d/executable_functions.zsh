function cdp() {
  # echo "Going to projects/$*"
  cd "${HOME}/projects/$*" ;
}

# Repeat n times command
function repeat() {
  local i max
  max=$1; shift;
  for ((i=1; i <= max ; i++)); do  # --> C-like syntax
    eval "$@";
  done
}

# Mkdir with CD directly
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

# Add easy extract support
function extract () {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.tar.xz)  tar Jxvf $1   ;;
      *.lzma)    unlzma $1     ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *.xz)      unxz $1       ;;
      *.exe)     cabextract $1 ;;
      *)         echo "don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Function to run upon exit of shell.
#function _exit() {
#    echo -e "Hasta la vista, baby"
#    echo -e "\e[1;5;32m                                            ____             \e[0m"
#    echo -e "\e[1;5;32m                                           | __ ) _   _  ___ \e[0m"
#    echo -e "\e[1;5;32m                                           |  _ \| | | |/ _ \\e[0m"
#    echo -e "\e[1;5;32m                                           | |_) | |_| |  __/\e[0m"
#    echo -e "\e[1;5;32m                                           |____/ \__, |\___|\e[0m"
#    echo -e "\e[1;5;32m                                                  |___/      \e[0m"
#    sleep 0.75
#}
#trap _exit EXIT
