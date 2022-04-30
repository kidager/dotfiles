#!/usr/bin/env bash
set -euo pipefail

source "common/variables.sh"
source "common/colors.sh"
source "common/functions.sh"

info "You are running bash \"${BASH_VERSION}\""
info "You are running: ${OS}"
sudo echo "You can now run commands as root"

info "📦 Checking requirements"
source "common/requirements.sh"
[ -f "common/requirements.${OS}.sh" ] && source "common/requirements.${OS}.sh"
info "✅ Requirements checked"

info "📂 Dot files root directory: $(bold "${DOTFILES_ROOT}")"
if [ ! -d "${DOTFILES_ROOT}" ]; then
    info "🔄 Cloning files into directory"
    git clone --quiet "https://github.com/kidager/dotfiles.git" "${DOTFILES_ROOT}"
    info "✅ Cloning dot files into ${DOTFILES_ROOT}"
elif [ -d "${DOTFILES_ROOT}/.git" ]; then
    info "🔄 Updating local repo"
    git -C "${DOTFILES_ROOT}" pull --quiet origin master
    info "✅ Updating local repo finished"
else
    error "Directory ${DOTFILES_ROOT} exists, but is not a git repo!"
    error "Make sure that DOTFILES_ROOT is correctly set and re-run the script."
    exit 1
fi

# TODO: Remove, dev mode
DOTFILES_ROOT="/home/jchaieb/projects/kidager/dotfiles"
# TODO: Remove, dev mode

if [ -d "${DOTFILES_ROOT}/dotfiles/shared" ]; then
    info "🔄 Installing shared dot files"
    for i in "${DOTFILES_ROOT}/dotfiles/shared/"**"/install.sh"; do
        if [ -r "$i" ]; then
            . "$i"
        fi
    done
    unset i
    info "✅ Installed shared dot files"
fi

if [ -d "${DOTFILES_ROOT}/dotfiles/personal" ]; then
    info "🔄 Installing personal dot files"
    for i in "${DOTFILES_ROOT}/dotfiles/personal/"**"/install.sh"; do
        if [ -r "$i" ]; then
            . "$i"
        fi
    done
    unset i
    info "✅ Installed personal dot files"
fi
