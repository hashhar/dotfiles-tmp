# Default programs {{{
export EDITOR=vim
export VISUAL=vim

# Browser {{{
if [[ -n "$DISPLAY" ]]; then
	export BROWSER=firefox
else
	export BROWSER=elinks
fi
# }}}
# }}}

# Mount point variables {{{
Resources	DEFAULT=/media/Resources
Media		DEFAULT=/media/Media
Data		DEFAULT=/media/Data
GitHub		DEFAULT=${Resources}/GitHub
# }}}

# Pacaur {{{
export AURDEST='/home/ashhar/makepkg/sources/'
# }}}

# vim: tw=80 fdm=marker
