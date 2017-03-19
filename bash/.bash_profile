#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start Xorg if logging in from virtual terminal 1
if [ -z "$DISPLAY" ] && [ -n "$XDG_VNTR" ] && [ "$XDG_VNTR" -eq 1 ]; then
	exec startx
fi
