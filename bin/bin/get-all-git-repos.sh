#!/bin/bash

find / -type d -name ".git" -print0 | \
	xargs -n1 -0 dirname
