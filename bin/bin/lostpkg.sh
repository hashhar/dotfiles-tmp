#!/bin/bash

_cache_file="${XDG_CACHE_HOME:=~/.cache}/packages.gz"
_packages_file='https://aur.archlinux.org/packages.gz'

# If cache file is older than a week or doesn't exist yet, update it.
_setup_cache()
{
    local last_update=1
    [ -e "${_cache_file}" ] && last_update=$(stat -c %Y "${_cache_file}")
    # Compare the epoch times of existing file and current date.
    if (( $(date +%s) > last_update + 604800 )); then
        # Download without any output, timeout early and create destination.
        curl --create-dirs --connect-timeout 5 -s "${_packages_file}" -o "${_cache_file}"
    fi
}

_setup_cache
comm -23 <(pacman -Qqm | sort) <(gzip -cd ${_cache_file} | sort)
