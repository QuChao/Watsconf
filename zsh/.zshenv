#! /usr/bin/env zsh
# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-
#
# Copyright(C) Chao QU <dev#quchao.com> All rights reserved.


##########
# Basics
##########

## Locale
export LANG="en_US.UTF-8"
#export LC_ALL="en_US.utf8"
#export LC="en_US.utf8"
#export LESSCHARSET="utf-8"

## LD_LIBRARY_PATH
[[ -z "${ld_library_path}" ]] && typeset -xT LD_LIBRARY_PATH ld_library_path

## INCLUDE
[[ -z "${include}" ]] && typeset -xT INCLUDE include

## Editor
export EDITOR="vi"

## VTE terminal: fix EAW width
export VTE_CJK_WIDTH=1

## Compilation flags: x64
export ARCHFLAGS="-arch x86_64"

## SSL key log
export SSLKEYLOGFILE="${HOME}/.sslkeylog"

##########
# Funcs
##########

## Function: is_program_exists
function is_program_installed () {
    if whence "$1" &>/dev/null ; then
        return 0
    else
        return 1
    fi
}

## Function: auto-zcompile & source
#function _auto_zcompile_source () {
#    local A; A=$1
#    [[ -e "${A:r}.zwc" ]] && [[ "$A" -ot "${A:r}.zwc" ]] ||
#    zcompile ${A} >/dev/null 2>&1 ; source ${A}
#}


##########
# System-specified Configs
##########

## Load configs
[[ -f "${ZDOTDIR}/.zshenv_$(uname)" ]] && source "${ZDOTDIR}/.zshenv_$(uname)"


##########
# Extras
##########

## Listing colors
if is_program_installed dircolors ; then
    # LS_COLORS
    eval $(dircolors -b "${HOME}/.dircolors")
    export ZLSCOLORS="${LS_COLORS}"

    # Autocompletion
    zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
    zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#)*=0=01;31"
else
    ### LSCOLORS
    export LSCOLORS="exfxcxdxbxegedabagacad"
    export CLICOLOR=true
fi
