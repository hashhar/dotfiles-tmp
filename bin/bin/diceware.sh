#!/bin/bash
#
# Description: Generate a diceware style password using n random words. By
#              default it uses 4 words.
# Usage:       ./diceware.sh [num of words]

# Usage {{{
show_help() {
    cat << EOF
Generate a dicewre-like password using a given number of words taken randomly
from any available wordlist on the system or a file of your choosing.
${cbr}Usage:${cc} $scriptname [option...]
${cbr}Options:${cc}
  -h        Show this help.
  -f file   The absolute path to the wordlist to use. If absent, all files in
            ${cbg}/usr/share/dict/${cc} will be tried starting with
            ${cbg}words${cc}.
  -n number The number of words to use for generating the password.
  -s        If present, all words will be joined and presented as a single word
            to allow easier copy and paste.
  -v        Print the name of the file used to generate the password.

${cbr}Exit Codes:${cc}
  0         Indicates successful creation of a password.
  1         Problem parsing command line arguments.
  2         Extra arguments passed to the script which cause an issue while
            parsing command line arguments.
  3         Issues finding proper default wordlists on the system. Try passing
            an absolute path to the file using ${cbg}-f${cc}.

This uses the ${cbg}shuf${cc} command behind the scenes so the output depends
on that.

EOF
}
# }}}

# Colours {{{
initializeColours() {
    # Check if stdout is a terminal.
    if [[ -t 1 ]]; then
        # See if it supports colors.
        ncolors="$(tput colors)"
        if [[ -n "$ncolors" ]] && (( ncolors > 8 )); then
            cb="$(tput bold)"
            cu="$(tput smul)"
            cc="$(tput sgr0)"
            cr="$(tput setaf 1)"; cbr="$cb$(tput setaf 1)"
            cg="$(tput setaf 2)"; cbg="$cb$(tput setaf 2)"
        else
            cb="$(tput bold)"
            cu="$(tput smul)"
            cc="$(tput sgr0)"
            cr="$cb"; cbr="$cb"
            cg="$cb"; cbg="$cb"
        fi
    fi
}
# }}}

scriptname='diceware.sh'

initializeColours
wordlists=('/usr/share/dict/words'
           '/usr/share/dict/cracklib-small')

for wordlist in "${wordlists[@]}"; do
    [[ -f "$wordlist" ]] && shuf -n"${1:-4}" "$wordlist" && break
done
