# Common aliases definitions

if [ -d /etc/zsh/aliases.d ]; then
  for i in /etc/zsh/aliases.d/*.sh; do
    if [ -r "$i" ]; then
      . "$i"
    fi
  done
  unset i
fi
