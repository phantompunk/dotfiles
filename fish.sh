#!/bin/bash

# Install Fish Shell (if not installed)
if ! [ -x "$(command -v fish)" ];
then
    echo "Installing Fish Shell.";
    brew install fish;
fi

# Add Fish Shell to /etc/shells
echo /usr/local/bin/fish | sudo tee -a /etc/shells

# Set Fish as Default Shell
echo "Changing default shell to Fish 🐟."
chsh -s $(which fish)

echo "Configuring Fish functions and abbreviations."

# Configure functions directory
mkdir -p ~/.config/fish/functions

# Configure Greeting
install functions/fish_greeting.fish ~/.config/fish/functions

# Configure Prompt
install functions/fish_prompt.fish ~/.config/fish/functions


# Configure Bass
curl -sL https://raw.githubusercontent.com/edc/bass/master/functions/__bass.py -o ~/.config/fish/functions/__bass.py
install functions/bass.fish ~/.config/fish/functions

# Configure Kubernetes
install functions/kubectl.fish ~/.config/fish/functions
install functions/kubectx.fish ~/.config/fish/functions
install functions/kubens.fish ~/.config/fish/functions

# Configure Python
install functions/python.fish ~/.config/fish/functions
install functions/pip.fish ~/.config/fish/functions

# Configure Abbrieviations
/bin/bash -c './abbrs.sh'

# Configure Go-lang
/bin/bash -c './go.sh'