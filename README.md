# My neovim config <3

```
Startuptime: 79.58ms

Based on the actual CPU time of the Neovim process till UIEnter.
This is more accurate than `nvim --startuptime`.
  LazyStart 16.02ms
  LazyDone  69.74ms (+53.72ms)
  UIEnter   79.58ms (+9.84ms)
```

## Introduction

This repository contains my personal neovim configuration that I use in day-to-day work.
Since I'm actively using it, it is in my very own interest to maintain and fix any issues that may arise.

I have went over numerous neovim configs and combined all the best autocommands, keymaps and options that work for me.
Even though it is opionated, it has very good balance between ready to be used now, and providing good defaults and starting point for your own configuration.

It contains all the useful plugins and configurations for web-dev and general programming.

## Installation

### Install External Dependencies

External Requirements:

- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If want to write Typescript, you need `npm`
  - If want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install Recipes

Below you can find OS specific install instructions for Neovim and dependencies.

After installing all the dependencies continue with the [Install Kickstart](#Install-Kickstart) step.

#### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
   either follow the instructions on the page or use winget,
   run in cmd as **admin**:

```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
   open a new one so that choco path is set, and run in cmd as **admin**:

```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>

#### Linux Install

<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip neovim
```

</details>
<details><summary>Debian Install Steps</summary>

```
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
```

</details>
<details><summary>Fedora Install Steps</summary>

```
sudo dnf install -y gcc make git ripgrep fd-find unzip neovim
```

</details>

<details><summary>Arch Install Steps</summary>

```
sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim
```

</details>

## Thanks to

When I initially started using neovim, my starting point was [NvChad](https://nvchad.com/). That's why you may find keybindings similar to NvChad's

_This is a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) that moves from a single file to a multi file configuration (huge thanks to them)._
