# :wrench: dotfiles

Intended to provide a friendly crossplatform expierence using Fish, Kitty, and Homebrew, compatible with macOS and Linux. No symlinking or extra tooling required.



> A mashup of ideas from various sources such [zellwk](https://github.com/zellwk/dotfiles), [mathiasbynens](https://github.com/mathiasbynens/dotfiles), [rkalis](https://github.com/rkalis/dotfiles), and [durdn](https://bitbucket.org/durdn/cfg.git). The structure for these dotfiles is from durdn's great write up on [dotfiles](https://www.atlassian.com/git/tutorials/dotfiles).



![Kitty terminal running fish examples](https://i.imgur.com/krmLPeY.png)

## Quick start

Batteries included shell script walking you through the install options.

| 🚧 Use at your own risk! Review and modify before executing. |
| ----------------------------------------------------------- |

```shell
bash <(curl -Lks https://bit.ly/phpnk-install)
```

*Complete bash script stored in gist - [gist.github.com/phantompunk/init.sh](https://gist.github.com/phantompunk/d9a9df62e0330663cead308cbfb7803f)*

## How it works

Symlinking and extra tooling is avoided by cloning a [bare git repository](https://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/) to your home directory. Dotfiles and configuration files are right where they are intended to be. Read this for more info on using [bare repos for Dotfiles](https://www.atlassian.com/git/tutorials/dotfiles).



This repo contains files in the exact location as if they lived in my home directory, that is because they will.

- `.gitignore`
- `.gitconfig`
- `.config` for other files
  - `Brewfile` for convience
  - `fish` functions, variables, abbrievatsions and aliases
  - `kitty` settings and themes
  - `nvim` settings, keymaps, and plugins



## Install

For fresh installs there are a few requirements.

All platforms need `git`, `curl`, and `nvim`.

### MacOS

```
sudo softwareupdate -i -a
xcode-select --install
```



### Linux (Debian)

```
apt update -y
apt install -y build-essential
```



## Usage

```shell
touch ~/.vimrc
config status
config add ~/.vimrc
config commit -m "fix: update vim settings"
config push
```



## :hammer_and_wrench: Toolset

My current favorite tools I expect on every machine I use:

### Shell: Fish Shell :fish:

### Package Manager: Homebrew :beer:

### Terminal: Kitty :cat2:

### Apps

1. **[bat](https://github.com/sharkdp/bat)** - A cat clone with syntax highlighting

2. **[exa](https://github.com/ogham/exa)** - A ls replacement with hightlighting

