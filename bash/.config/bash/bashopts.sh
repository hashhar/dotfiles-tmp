# Bash options {{{
shopt -s cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s checkjobs
shopt -s globstar
shopt -s histappend
shopt -s lithist
# }}}

# History {{{
export HISTCMD
export HISTCONTROL='ignorespace:erasedups'
export HISTFILESIZE='10000'
export HISTSIZE='10000'
export HISTTIMEFORMAT='%F %T '
# }}}

# vim: tw=80 fdm=marker et sts=4 ts=4 sts=4 sw=4
