#! /usr/bin/env zsh
# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-
#
# Copyright(C) Chao QU <dev#quchao.com> All rights reserved.


##########
# Basics
##########

## Basics
umask 022                   # default umask
bindkey -v                  # vim-like keybind
unsetopt beep               # no beep


##########
# Completion
##########

## Start up
zstyle :compinstall filename "${ZDOTDIR}/.zshrc"

## Init
autoload -Uz compinit
compinit

## Zstyles (zstyle <context> <styles>)
zstyle ":completion:*:descriptions" format "%U%B%d%b%u"
zstyle ":completion:*:warnings" format "%BSorry, no matches for: %d%b"


##########
# Histories
##########

## Per-user history file
HISTFILE="${ZDOTDIR}/.tmp/${USER}-history"

## History related
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
setopt extended_history         # save beginning and ending timestamps
setopt share_history            # share histories for GNU Screens
setopt inc_append_history       # append new items
setopt hist_ignore_space        # ignore spaces ahead a command
setopt hist_ignore_all_dups     # no duplicate histories
setopt hist_reduce_blanks       # trim spaces
setopt hist_no_store            # ignore the history (fc -l) commands


##########
# Misc.
##########

## Color alias
### Setup some colors to use later in interactive shell or scripts
export COLOR_NC="\033[0m" # No Color
export COLOR_WHITE="\033[1;37m"
export COLOR_BLACK="\033[0;30m"
export COLOR_BLUE="\033[0;34m"
export COLOR_LIGHT_BLUE="\033[1;34m"
export COLOR_GREEN="\033[0;32m"
export COLOR_LIGHT_GREEN="\033[1;32m"
export COLOR_CYAN="\033[0;36m"
export COLOR_LIGHT_CYAN="\033[1;36m"
export COLOR_RED="\033[0;31m"
export COLOR_LIGHT_RED="\033[1;31m"
export COLOR_PURPLE="\033[0;35m"
export COLOR_LIGHT_PURPLE="\033[1;35m"
export COLOR_BROWN="\033[0;33m"
export COLOR_YELLOW="\033[1;33m"
export COLOR_GRAY="\033[1;30m"
export COLOR_LIGHT_GRAY="\033[0;37m"

## Hello Messages
echo -e "${COLOR_RED}Kernel Information: " `uname -smr`
echo -e "${COLOR_PURPLE}`zsh --version`"
echo -en "${COLOR_CYAN}Uptime: "; uptime
echo -en "${COLOR_BROWN}Server Time: "; date
