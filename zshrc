#!/bin/bash

# Just set the user and host regardless of the system we are on
# export USER=mollerse
# export HOST=tiamat

# Turn on some options

# Don't clobber existing files
setopt noclobber
# Typing the name of a directory will act like `cd [dir]`
setopt autocd
# Can cd to vars without $
setopt cdablevars
# Please correct me
setopt correct
setopt correctall

# Completions

autoload -U compinit
# https://carlosbecker.com/posts/speeding-up-zsh/
# if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
#   compinit
# else
  compinit -C
# fi

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
