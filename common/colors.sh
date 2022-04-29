#!/usr/bin/env bash

C_X="\033[0m"

C_RED="\033[31m"
C_GREEN="\033[32m"
C_YELLOW="\033[33m"
C_BLUE="\033[34m"
C_MAGENTA="\033[35m"
C_CYAN="\033[36m"

C_ERROR="\033[1;31m"
C_WARNING="\033[1;33m"
C_WARN="$C_WARNING"
# shellcheck disable=SC2034
C_INFO="$C_BLUE"
C_SUCCESS="\033[1;32m"
# shellcheck disable=SC2034
C_DONE="$C_SUCCESS"
C_LINK="\033[4;36m"
C_CMD="\033[1;35m"

print_in_color() {
  local color="$1"
  shift
  local NL="\n"
  if [ "$1" = "--inline" ] || [ "$1" = "-i" ]; then
    NL=""
    shift
  fi
  if [[ -z ${NO_COLOR+x} ]]; then
    printf "$color%b$C_X%b" "$@" "$NL";
  else
    printf "%b%b" "$@" "$NL";
  fi
}

red() { print_in_color "${C_RED}" "$@"; }
green() { print_in_color "${C_GREEN}" "$@"; }
yellow() { print_in_color "${C_YELLOW}" "$@"; }
blue() { print_in_color "${C_BLUE}" "$@"; }
magenta() { print_in_color "${C_MAGENTA}" "$@"; }
cyan() { print_in_color "${C_CYAN}" "$@"; }
bold() { print_in_color "\033[1m" "$@"; }
underlined() { print_in_color "\033[4m" "$@"; }
red_bold() { print_in_color "${C_ERROR}" "$@"; }
green_bold() { print_in_color "${C_SUCCESS}" "$@"; }
yellow_bold() { print_in_color "${C_WARN}" "$@"; }
blue_bold() { print_in_color "\033[1;34m" "$@"; }
magenta_bold() { print_in_color "${C_CMD}" "$@"; }
cyan_bold() { print_in_color "\033[1;36m" "$@"; }
red_underlined() { print_in_color "\033[4;31m" "$@"; }
green_underlined() { print_in_color "\033[4;32m" "$@"; }
yellow_underlined() { print_in_color "\033[4;33m" "$@"; }
blue_underlined() { print_in_color "\033[4;34m" "$@"; }
magenta_underlined() { print_in_color "\033[4;35m" "$@"; }
cyan_underlined() { print_in_color "${C_LINK}" "$@"; }

error() { red_bold "$@"; }
alert() { error "$@"; }

warning() { yellow_bold "$@"; }
warn() { warning "$@"; }

info() { blue "$@"; }
success() { green_bold "$@"; }
link() { cyan_underlined "$@"; }
cmd() { magenta_bold "$@"; }
