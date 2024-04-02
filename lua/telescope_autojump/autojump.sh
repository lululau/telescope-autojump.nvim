#!/bin/bash

if [ "$(uname)" = Linux ]; then
  autojump_db="$HOME/.local/share/autojump/autojump.txt"
else
  autojump_db="$HOME/Library/autojump/autojump.txt"
fi

sort -n -r "$autojump_db" | cut -f2 | sed 's/$/\//'
