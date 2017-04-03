#!/bin/bash
#
# Description: Generate a diceware style password using n random words. By
#              default it uses 4 words.
# Usage:       ./diceware.sh [num of words]

wordlists=('/usr/share/dict/words'
           '/usr/share/dict/cracklib-small')

for wordlist in ${wordlists[@]}; do
    [[ -f "$wordlist" ]] && shuf -n${1:-4} "$wordlist" && break
done
