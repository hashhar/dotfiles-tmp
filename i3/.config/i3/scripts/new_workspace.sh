#!/usr/bin/env bash

_last_workspace=$(i3-msg -t get_workspaces | tr , '\n' | grep '\"num\":' | cut -d : -f 2 | sort -rn | head -1)
i3-msg workspace "$(($_last_workspace + 1)):"
