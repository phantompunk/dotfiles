#!/usr/bin/env fish

set GO_DIR ".go"

# Set Environment Variables
set -Ux GOPATH "$HOME/$GO_DIR"
set -Ux GOROOT (brew --prefix golang)"/libexec"

# Set Path
fish_add_path $GOPATH"/bin"
fish_add_path $GOROOT"/bin"

# Create Go directory
mkdir -p $GOPATH

# Install Go-Lang (if not already installed)
if ! [ -x "$(command -v go)" ];
then
    echo "Installing Go Lang";
    brew install go;
end;