#! /usr/bin/env zsh
# -*- mode: sh; coding: utf-8; indent-tabs-mode: nil -*-
#
# Copyright(C) Chao QU <dev#quchao.com> All rights reserved.

### Oh-my-zsh
## Path
export ZSH="${ZDOTDIR}/oh-my-zsh"

## Settings

# default username
DEFAULT_USER="Chappell"

# Uncomment the following line to use case-sensitive completion.
#CASE_SENSITIVE='true'

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE='true'

# Uncomment the following line to change how often to auto-update (in days).
#export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS='true'

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE='true'

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION='true'

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="${ZDOTDIR}/custom"


##########
# Themes
##########

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Time Format: 24/12
#ZSH_TIME="24"

# Theme settings for agnoster
NOTIFICATION_ENABLED="true"

##########
# Plugins, pt.1
##########

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    sudo
    extract
    colored-man-pages
    z
)

##########
# Plugins, pt.2
##########

## Git
if is_program_installed git ; then
    plugins=( git $plugins )
fi

## Screen
if is_program_installed screen ; then
    plugins=( screen $plugins )
fi

## GnuPG agent
if is_program_installed gpg-agent ; then
    plugins=( gpg-agent $plugins )
fi

##########
# System-specified Configs
##########

## Load configs
[[ -f "${ZDOTDIR}/.zshrc_$(uname)" ]] && source "${ZDOTDIR}/.zshrc_$(uname)"

##########
# Core
##########

## Load core
source "${ZSH}/oh-my-zsh.sh"
