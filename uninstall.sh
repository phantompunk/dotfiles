#!/bin/bash

abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

read -rp "Are you sure you want to uninstall all dotfile configurations? [y/n] "
[[ "${REPLY}" == [yY]* ]] || abort

if [ -x "$(command -v zsh)" ];
then shell=zsh else shell=bash
fi

echo "Reverting shell to $shell."
chsh -s $(which $shell)

echo -e "Uninstalling Homebrew and all packages."
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

echo "Removing Fish config and functions."
rm -rf ~/.config/fish/

echo "Restoring default Terminal settings."
defaults write com.apple.terminal "Default Window Settings" -string "Basic"
defaults write com.apple.terminal "Startup Window Settings" -string "Basic"