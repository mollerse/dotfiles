#!/bin/bash

# Just set the user and host regardless of the system we are on
export USER=mollerse
export HOST=tiamat

# Turn on some options

# Don't clobber existing files
setopt noclobber
# Please correct me
setopt correct
setopt correctall

# Completions

autoload -U compinit
compinit

# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Source the rest of the relevant files

for file in ~/.{zsh_prompt,aliases,exports,functions,history,extra}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file
