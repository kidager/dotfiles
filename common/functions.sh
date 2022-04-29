#!/usr/bin/env bash

askConfirm() {
    read -erp "$(info "$1 (y/N):")"$'\n' confirm
    confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')
    if [[ $confirm != "y" ]] && [[ $confirm != "yes" ]]; then
        return 1
    else
        return 0
    fi
}
