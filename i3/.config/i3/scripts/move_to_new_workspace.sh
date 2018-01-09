#!/bin/bash

_last_workspace=$(i3-msg -t get_workspaces | tr , '\n' | grep '\"num\":' | cut -d : -f 2 | tail -1)
i3-msg move container to workspace "$((_last_workspace + 1)):", workspace "$((_last_workspace + 1)):"
