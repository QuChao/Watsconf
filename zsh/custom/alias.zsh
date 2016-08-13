#! /usr/bin/env zsh
# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-
#
# Copyright(C) Chao QU <dev#quchao.com> All rights reserved.

##########
# Alias
##########

## Listing Colors
if is_program_installed dircolors ; then
    ### GNU
    alias ls="ls -F --color=auto --show-control-chars"
    alias la="ls -haF --color=auto --show-control-chars"
    alias ll="ls -hlF --color=auto --show-control-chars"
    alias lla="ls -hlaF --color=auto --show-control-chars"
    alias lsd="ls -ld *(-/DN)"
else
    ### Darwin
    alias ls="ls -FG"
    alias la="ls -haFG"
    alias ll="ls -hlFG"
    alias lla="ls -hlaFG"
    alias lsd="ls -ld *(-/DN)"
fi

## CMD Fixes
alias rm="nocorrect rm -i"
alias mv="nocorrect mv -i"
alias cp="nocorrect cp -i"
alias man="nocorrect man"
alias mkdir="nocorrect mkdir"
alias mkcd="nocorrect mkcd"
alias ping="ping -c4"
alias top="top -o cpu"
alias df="df -kh"
alias du="du -kh"

## Grep
alias grep="grep --color"
alias egrep="egrep --color"
alias fgrep="fgrep --color"

## File Types
alias -s html="vi"
alias -s py="vi"
alias -s js="vi"
alias -s php="vi"
alias -s txt="vi"
alias -s gz="extract" # tar -xzvf
alias -s tgz="extract" # tar -xzvf
alias -s zip="extract" # unzip
alias -s bz2="extract" # tar -xjvf

## Utilities
alias please='sudo $(fc -ln -1)'
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias f="find . -iname"
alias ducks="du -cksh * | sort -rn|head -11" # Lists with sizes
alias systail="less -F /var/log/system.log"
alias logtail="less -F"
alias hexrand="cat /dev/urandom | hexdump -C | grep 'ca fe'" # show random data in hex
alias srsync="rsync -rvz -e 'ssh'"
alias minfo="ffprobe -v quiet -print_format json -show_format -show_streams -i "

## Darwin Only
if [[ $OSTYPE == darwin* ]]; then
    ## Removal of x attributes
    alias rmxattr="xattr -d com.apple.metadata:kMDItemWhereFroms"

    if [[ -z "${SSH_CONNECTION}" ]]; then
        ## Editor
        if is_program_installed mvim ; then
            #export EDITOR="mvim"
            alias vi="mvim"
        fi

        ## Diff
        if is_program_installed bcomp ; then
            alias diff="bcomp"
        else
            alias diff="diff -u"
        fi
    fi
fi

