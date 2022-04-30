#!/usr/bin/env bash
# shellcheck disable=SC2034 # This file defines variables to be used later

OS="$(uname | tr '[:upper:]' '[:lower:]')"

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

TMP_DIR="/tmp/$(date +%s | md5sum | head -c 32)"
FONTS_DIR="/usr/share/fonts"
LOG_FILE="${DOTFILES_ROOT}/install-$(date +%s).log"
