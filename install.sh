#!/bin/bash

install () {
    local DIR
    DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd -P)

    # Install dotfiles
    for file in $DIR/dotfiles/*; do
      if [ -f "$file" ]; then
        name=$(basename $file)
        ln -si $file $HOME/.$name
      fi
    done

    # Install config files
    for file in $DIR/configs/*; do
      # Config-files who live as dotfiles in the $HOME-dir
      if [ -f "$file" ]; then
        name=$(basename $file)
        ln -si $file $HOME/.$name
      fi

      # Config-files who live in specified folders in $HOME/.config/
      if [ -d "$file" ]; then
        for cfile in $file/*; do
          if [ -f "$cfile" ]; then
            folder=$(basename "$(dirname $cfile)")
            name=$(basename $cfile)
            ln -si $cfile $HOME/.config/$folder/$name
          fi
        done
      fi
    done

    # Create an .extra file for things that are specific to this computer
    touch $HOME/.extra
    echo "export DOTFILES=\"$DIR\"" >> $HOME/.extra

}
install
