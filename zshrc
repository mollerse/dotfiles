for file in ~/.{zsh_prompt,aliases,exports,extra,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM