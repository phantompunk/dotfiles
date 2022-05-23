#!/bin/bash

# Install Fish Shell (if not installed)
if ! [ -x "$(command -v fish)" ];
then
    echo "Installing Fish Shell";
    brew install fish;
fi

# Add Fish Shell to /etc/shells
echo /usr/local/bin/fish | sudo tee -a /etc/shells

# Set Fish as Default Shell
chsh -s $(which fish)

# Configure functions directory
mkdir -p ~/.config/fish/functions

# Configure Greeting
install functions/fish_greeting.fish ~/.config/fish/functions

# Configure Prompt
install functions/fish_prompt.fish ~/.config/fish/functions

# Configure Abbrieviations
install functions/abbrs.fish ~/.config/fish/functions

# Configure Bass
install functions/__bass.py ~/.config/fish/functions
install functions/bass.fish ~/.config/fish/functions

# Configure Kubernetes
install functions/kubectx.fish ~/.config/fish/functions
install functions/kubens.fish ~/.config/fish/functions
install functions/kubernetes.fish ~/.config/fish/functions

# Configure Python
install functions/python.fish ~/.config/fish/functions
install functions/pip.fish ~/.config/fish/functions

# Configure Go-lang
install functions/go_lang.fish ~/.config/fish/functions
