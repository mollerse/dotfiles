#!/bin/bash

for file in aliases gitconfig inputrc exports extra functions; do
	rm -f ~/.$file
	ln -s $PWD/$file ~/.$file
done

if [ "$1" = "" ]; then
	for file in zshrc zsh_prompt; do
		rm -f ~/.$file
		ln -s $PWD/$file ~/.$file
	done
elif [ "$1" = "bash" ]; then
	for file in bashrc bash_profile bash_prompt; do
		rm -f ~/.$file
		ln -s $PWD/$file ~/.$file
	done	
fi

touch ~/.bash_history