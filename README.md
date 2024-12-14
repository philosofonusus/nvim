# My neovim config <3

```
Startuptime: 80.25ms

Based on the actual CPU time of the Neovim process till UIEnter.
This is more accurate than `nvim --startuptime`.
  LazyStart 9.37ms
  LazyDone  75.81ms (+66.44ms)
  UIEnter   80.25ms (+4.44ms)
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
- `Node` <= `22.11.0` & `npm`
- `Deno` to use deno capabilities
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - `npm i -g typescript typescript-language-server`

### Install Mason dependencies

After installing all external dependecies run following command:

- `:MasonInstallAll`

## Thanks to

When I initially started using neovim, my starting point was [NvChad](https://nvchad.com/). That's why you may find keybindings similar to NvChad's

_This is a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) that moves from a single file to a multi file configuration (huge thanks to them)._
