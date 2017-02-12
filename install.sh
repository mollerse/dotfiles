#!/bin/bash

for file in zshrc zsh_prompt aliases gitconfig inputrc exports extra functions npmrc; do
	rm -f ~/.$file
	ln -s $PWD/$file ~/.$file
done

touch ~/.bash_history
