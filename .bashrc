#
## @file bashrc
## @brief Bash .bashrc file with shell environment setup
## @author Ronald Joe Record (rr at ronrecord dot com)
## @copyright Copyright (c) 2012, Ronald Joe Record, all rights reserved.
## @date Written 17-Sep-2012
## @version 1.0.1
##
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# TMP and TEMP are defined in the Windows environment.  Leaving
# them set to the default Windows temporary directory can have
# unexpected consequences.
unset TMP
unset TEMP

# Alternatively, set them to the Cygwin temporary directory
# or to any other tmp directory of your choice
# export TMP=/tmp
# export TEMP=/tmp

# Or use TMPDIR instead
export TMPDIR=/tmp

# If you are running through a proxy service some external programs may need
# to know the proxy setting (e.g. gem). If so, configure and uncomment:
# export http_proxy=http://proxy.vmware.com:3128
#export no_proxy=alpha.wallhaven.cc

export GOOGLE_APPLICATION_CREDENTIALS=$HOME/Keys/Text-to-Speech-d00ec3799688.json
export DOTNET_CLI_TELEMETRY_OPTOUT=true

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
else
    export CLICOLOR=1
    export LSCOLORS=DxFxcxdxCxegedabagacad
    alias ls='/bin/ls -G'
fi

if [ -f ~/.functions ]; then
    . ~/.functions
fi

# Source in the iTerm 2 tab function if it exists
if [ -f ~/.tab_bash ]; then
    . ~/.tab_bash
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.private ]; then
    . ~/.private
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# My drfree function
if [ -f /usr/local/share/bash/drfree ]; then
    . /usr/local/share/bash/drfree
fi

eval "$(zoxide init bash)"

complete -C /usr/local/bin/vault vault

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f "/Users/doctorwhen/.ghcup/env" ] && source "/Users/doctorwhen/.ghcup/env" # ghcup-env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
