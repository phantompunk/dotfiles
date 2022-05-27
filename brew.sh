#!/bin/bash

# Install Homebrew (if not already installed)
if ! [ -x "$(command -v brew)" ];
then
    echo "Installing Homebrew";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
fi

if ! [ -x "$(command -v brew)" ];
then
    echo "Adding Homebrew to PATH";
    echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Make sure to update Homebrew to the latest version
brew update

# Upgrade any installed formulae
brew upgrade

# Install Casks
brew tap homebrew/cask

# Install Apps
brew install asdf
brew install aws-google-auth
brew install bat
brew install eksctl
brew install exa
brew install fish
brew install --cask iterm2
brew install jq
brew install k9s
brew install kubectx
brew install kubernetes-cli
brew install minikube
brew install node
brew install pipeline
brew install tldr

# Remove outdated versions
brew cleanup

# Uninstall Homebrew
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"