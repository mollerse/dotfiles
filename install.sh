#!/bin/bash

for file in zshrc zsh_prompt aliases gitconfig inputrc exports functions npmrc history gitattributes; do
	rm -f ~/.$file
	ln -s $PWD/$file ~/.$file
done
