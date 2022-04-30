#!/usr/bin/env bash

## Install all the required tools specific to linux

#================================ APT ================================
declare -A APT_PACKAGES=(
    # ["package"]="Human readable name"
    ["wget"]="wget"
    ["curl"]="curl"
    ["zsh"]="ZSH"
    ["dos2unix"]="dos2unix"
    ["git"]="Git"
    ["gh"]="Github CLI"
    ["zip"]="zip"
    ["unzip"]="unzip"
    ["tar"]="tar"
    ["unrar"]="unrar"
    ["gzip"]="gzip"
    ["p7zip"]="p7zip"
    ["bzip2"]="bzip2"
    ["lzma"]="lzma"
)

## Update apt
info "🔄 Updating apt"
DEBIAN_FRONTEND=noninteractive sudo apt -yq update > /dev/null 2>&1
info "✅ apt updated"

## Install apt packages
for package in "${!APT_PACKAGES[@]}"; do
    info "📦 Checking ${APT_PACKAGES[$package]}"
    if type "${package}" > /dev/null 2>&1; then
        info "└✅ ${APT_PACKAGES[$package]} already installed";
    else
        info "└🔄 Installing ${APT_PACKAGES[$package]}"
        DEBIAN_FRONTEND=noninteractive \
            sudo apt -yq install "${package}" > /dev/null 2>&1 \
            && success " 🎉 ${APT_PACKAGES[$package]} installed successfully"
    fi
done
#=============================== /APT ================================
