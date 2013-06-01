for file in ~/.{zsh_prompt,aliases,exports,extra,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file