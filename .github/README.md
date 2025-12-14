# :wrench: dotfiles

Personal configuration files for a modern macOS/Linux development environment. Built around Fish shell, Neovim, and Kitty terminal, with no symlinking or extra tooling required.

This repository focuses on **configuration** and relies on [phantompunk/machine](https://github.com/phantompunk/machine), which handles the installation of applications and software packages.



> Inspired by [zellwk](https://github.com/zellwk/dotfiles), [sobolevn](https://github.com/sobolevn/dotfiles), [mathiasbynens](https://github.com/mathiasbynens/dotfiles), [rkalis](https://github.com/rkalis/dotfiles), and [durdn](https://bitbucket.org/durdn/cfg.git). The bare repository approach is from durdn's excellent write-up on [dotfiles](https://www.atlassian.com/git/tutorials/dotfiles).

![Kitty terminal running fish examples](https://i.imgur.com/VlKEn2q.png)

## Quick start

Batteries included shell script walking you through the install options.

| 🚧 Use at your own risk! Review and modify before executing. |
| ----------------------------------------------------------- |

```shell
git clone --bare https://github.com/phantompunk/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```

*Complete bash script stored in gist - [gist.github.com/phantompunk/init.sh](https://gist.github.com/phantompunk/d9a9df62e0330663cead308cbfb7803f)*

## How it works

This setup avoids symlinking and extra tooling by using a [bare git repository](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) cloned to your home directory. Dotfiles and configuration files live exactly where they're intended to be. Learn more about this approach: [Bare repos for Dotfiles](https://www.atlassian.com/git/tutorials/dotfiles).

Files are stored in their actual home directory locations:

### Git Configuration
- `.gitconfig` - Git aliases, SSH signing keys, and settings
- `.gitignore` - Global ignore patterns for macOS, VSCode, secrets, etc

### Shell: Fish (`.config/fish/`)
- **conf.d/** - Auto-loaded configurations
- **functions/** - Custom utility functions
- **completions/** - Command completion definitions

### Editor: Neovim (`.config/nvim/`)
- Lua-based configuration using lazy.nvim
- **Plugins**: LSP, Telescope, Treesitter, nvim-tree, Copilot, neotest, whichkey, snacks
- Custom keymaps, options, and autocommands

### Terminal: Kitty (`.config/kitty/`)
- Multiple theme configurations (Catppuccin Latte, Snazzy, Tokyo Night)
- Custom terminal behavior settings

### Keyboard: Karabiner (`.config/karabiner/`)
- Custom key mappings and keyboard shortcuts



## Install

### Prerequisites

First, install applications and tools using [phantompunk/machine](https://github.com/phantompunk/machine). That repository handles:
- Fish shell
- Neovim
- Kitty terminal
- Karabiner-Elements
- Git and git tools (diff-so-fancy)
- Modern CLI tools (eza, bat, zoxide, fd, ripgrep)
- Language tooling (pyenv, Go, Deno, Node.js)
- Homebrew package manager

### System Requirements

All platforms need `git`, `curl`, and `nvim` as a minimum.

#### macOS

```bash
sudo softwareupdate -i -a
xcode-select --install
```

#### Linux (Debian/Ubuntu)

```bash
apt update -y
apt install -y build-essential git curl
```



## Usage

### Managing Dotfiles

The `config` command is an alias for git that operates on your dotfiles:

```bash
# Check status of tracked dotfiles
config status

# Add a new configuration file
config add ~/.config/fish/functions/mynewfunction.fish

# Commit changes
config commit -m "feat: add new fish function"

# Push to remote
config push

# View changes
config diff

# Pull updates
config pull --rebase
```

### Light/Dark Theme Switching

Switch between light and dark themes across Kitty, Neovim, and bat:

```fish
# Switch to dark mode
dark
# Switch to light mode
light
```

## Customization

### Personal Information

Update your details in `.gitconfig`:
- Name and email (lines 20-21)
- SSH signing key (line 22)
- Signing program path (line 26)

### Theme Preferences

Set default theme in `.config/fish/conf.d/env.fish`:
```fish
set -gx THEME dark  # Options: "dark" or "light"
set -gx BAT_THEME TwoDark  # Or "OneHalfLight" for light theme
```
