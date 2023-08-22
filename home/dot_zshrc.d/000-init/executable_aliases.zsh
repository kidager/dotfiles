# Aliases definitions

if [ -f "/etc/zsh/zshaliases.zshrc" ]; then
  source "/etc/zsh/zshaliases.zshrc"
fi

if [ -f "${ZDOTDIR:-$HOME}/.zshaliases" ]; then
  source "${ZDOTDIR:-$HOME}/.zshaliases"
fi

for aliasFile in "${ZDOTDIR:-$HOME}/.zshaliases.d/"**/*".zsh"; do
  [ -f "$aliasFile" ] && source "$aliasFile"
done
