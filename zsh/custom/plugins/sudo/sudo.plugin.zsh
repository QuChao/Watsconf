# ------------------------------------------------------------------------------
# Description
# -----------
#
# sudo will be inserted before the command
#
# ------------------------------------------------------------------------------
# Ref
# -------
#
# * http://wu.nerd.moe/?p=1857
#
# ------------------------------------------------------------------------------

sudo-command-line() {
    # If current buffer is empth, get the last command
    [[ -z $BUFFER ]] && zle up-history
    # If the command not start with sudo
    [[ $BUFFER != sudo\ * ]] && {
      typeset -a bufs
      bufs=(${(z)BUFFER})
      # If the first word in BUFFER is an alias, replace is with
      # it's value
      if (( $+aliases[$bufs[1]] )); then
bufs[1]=$aliases[$bufs[1]]
      fi
      bufs=(sudo $bufs)
      BUFFER=$bufs
    }
    zle end-of-line
}
zle -N sudo-command-line
bindkey "\e\e" sudo-command-line

