#!/usr/bin/env bash
set -euo pipefail

source "common/colors.sh"
source "common/functions.sh"

OS="$(uname)"

info "You are running: ${OS}"

if [[ -z "${DOTFILES_ROOT-}" ]]; then
    DOTFILES_ROOT="${HOME}/.dotfiles"

    if [ -d "${DOTFILES_ROOT}" ]; then
        error "env variable DOTFILES_ROOT is not set, but the default folder ${DOTFILES_ROOT} exists!"
        error "Please set DOTFILES_ROOT manually or delete ${DOTFILES_ROOT}"
        exit 1
    fi

    export DOTFILES_ROOT

    echo "export DOTFILES_ROOT=\"\${HOME}/.dotfiles\"" >> "${HOME}/.zshenv"
fi

info "Working in: ${DOTFILES_ROOT}"
