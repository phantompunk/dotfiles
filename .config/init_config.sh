#!/bin/bash

case "$OSTYPE" in
    darwin*)  MACHINE="OSX" ;; 
    linux*)   MACHINE="LINUX" ;;
    bsd*)     MACHINE="BSD" ;;
    *)        MACHINE="unknown: $OSTYPE" ;;
esac

# Took these printing functions from https://github.com/Sajjadhosn/dotfiles
coloredEcho() {
    local exp="$1";
    local color="$2";
    local arrow="$3";
    if ! [[ $color =~ ^[0-9]$ ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput bold;
    tput setaf "$color";
    echo "$arrow $exp";
    tput sgr0;
}

info() {
    coloredEcho "$1" blue "====>"
}

success() {
    coloredEcho "$1" green "====>"
}

error() {
    coloredEcho "$1" red "====>"
}

substep_info() {
    coloredEcho "$1" magenta "========"
}

substep_success() {
    coloredEcho "$1" cyan "========"
}

substep_error() {
    coloredEcho "$1" red "========"
}

abort() {
  error "$@" >&2 
  exit 1
}

if ! [ -x "$(command -v git)" ];
then
    abort "You must install Git before continuing"
fi

OS_LIST="OSX LINUX"
if echo "$OS_LIST" | grep -qw "$MACHINE";
then
   info "Configuring Dotfiles for $MACHINE"
else
   abort "These Dotfiles only support OSx and Linux: $MACHINE not supported"
fi

# Install Homebrew (if not already installed)
info "Installing Homebrew (if not already installed)"
read -n 1 -s -r -p "Press any key to continue";echo

if ! [ -x "$(command -v brew)" ];
then
    substep_info "Installing Homebrew";
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
    
    if [ "$MACHINE" == "OSX" ];
    then
        substep_info "Adding Homebrew to OSX PATH";
        read -n 1 -s -r -p "Press any key to continue";echo
        echo 'eval "$(/usr/local/bin/brew shellenv)"' >> $HOME/.zprofile
        eval "$(/usr/local/bin/brew shellenv)"
        substep_success "Homebrew successfully installed"
    elif [ "$MACHINE" == "LINUX"];
        substep_info "Adding Homebrew to Linux PATH"
        read -n 1 -s -r -p "Press any key to continue";echo
        echo '# Set PATH, MANPATH, etc., for Homebrew.' >> $HOME/.profile
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.profile
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

        source $HOME/.profile

        substep_info "Installing recommended packages: gcc and bundle"
        brew install gcc

        substep_success "Homebrew successfully installed"
        substep_info "Install this later"
        substep_success "sudo apt-get install build-essential"
    else
	abort "Not able to install Homebrew for $MACHINE"
    fi
else
    substep_info "Homebrew already installed"
fi

# Install Fish Shell (if not installed)
info "Checking Fish Shell installation"
read -n 1 -s -r -p "Press any key to continue";echo

if ! [ -x "$(command -v fish)" ];
then
    substep_info "Fish is not installed"
    read -rp "Are you sure you want to install Fish 🐟? [y/N] "
    [[ "${REPLY}" == [yY]* ]] || break;
    brew install fish
    substep_success "Fish shell installed"
else
    substep_info "Fish shell already installed"
fi

info "Checking if Fish is set as the default shell"
read -n 1 -s -r -p "Press any key to continue";echo

if [[ "$SHELL" != *"fish"* ]];
then
    substep_info "Changing default shell to Fish 🐟"
    read -rp "Sure you want to continue?[y/n] "
    [[ "${REPLY}" == [yY]* ]] || break;
    chsh -s "$(which fish)"
    substep_success "Changed the defualt shell to Fish 🐟"
else
    substep_info "Fish shell already set as default shell"
fi

info "Are my dotfiles configured at $HOME/dotfiles?"
read -n 1 -s -r -p "Press any key to continue";echo

if [ ! -e $HOME/dotfiles ]
then
    substep_info "Cloning dotfiles to $HOME/dotfiles"
    git clone --bare git@github.com:phantompunk/dotfiles.git $HOME/dotfiles
    substep_success "Dotfiles were cloned"
else
    substep_info "Dotfiles already exist at $HOME/dotfiles"
fi

function config {
    /usr/bin/git --git-dir="$HOME/dotfiles/" --work-tree="$HOME" "$@"
}

mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  substep_info "Checked out config.";
  else
    substep_info "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

info "Checking Brew package list"
read -n 1 -s -r -p "Press any key to continue";echo

if [ -x "$(command -v brew)" ];
then
    read -rp "Do you want to install the Brewfile in $HOME/.config/?[y/n] "
    if [[ "${REPLY}" == [yY]* ]];
    then
	brew bundle --file $HOME/.config/Brewfile
    else
        substep_info "Skipping Brewfile installation"
    fi
fi

success "Your $MACHINE is now ready for action!!"

