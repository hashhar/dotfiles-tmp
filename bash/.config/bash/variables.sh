# Pacaur {{{
export AURDEST='/home/ashhar/makepkg/sources/'
# }}}

# Browser {{{
if [[ -n "$DISPLAY" ]]; then
	export BROWSER=firefox
else
	export BROWSER=elinks
fi
# }}}

# vim: tw=80 fdm=marker
