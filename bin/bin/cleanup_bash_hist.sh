#!/bin/bash

filter() {
	patterns=("cd*" \
		"git status" \
		"git push*" \
		"git log*" \
		"git diff*" \
		"git stash*" \
		"man*" \
		"rm*" \
		"nvim*" \
		"code*" \
		"neofetch*" \
		"cat*" \
		"siege*" \
		"vegeta*" \
		"sudo systemctl*" \
		"du*" \
		"curl*" \
		"ag*" \
		"grep*" \
		"mpc*" \
		"ls*" \
		"cp*" \
		"tree*" \
		"todo*" \
		"note*" \
		"echo*" \
		"make*" \
		"find*" \
		"pkill*" \
		"pushd*" \
		"popd*" \
		"mv*" \
		"redis*")
	cat ~/.bash_history > /tmp/hist
	for pattern in "${patterns[@]}"; do
		sed -i -e "/^${pattern}/d" /tmp/hist
	done
	mv /tmp/hist ~/.bash_history
}

dedup() {
	temp="/tmp/.hist"
	nl ~/.bash_history | sort -k2 -k 1,1nr | uniq -f1 | sort -n | \
		cut -f2 > "$temp"
	mv "$temp" ~/.bash_history
}

dedup
