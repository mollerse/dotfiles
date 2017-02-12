for file in ~/.{zsh_prompt,aliases,exports,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file
