return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        integrations = {
          lsp_saga = true,
          cmp = true,
          gitsigns = true,
          lsp_trouble = true,
          treesitter = true,
          treesitter_context = true,
          which_key = true,
          native_lsp = { enabled = true },
          telescope = {
            enabled = true,
          },
          mason = true,
          nvim_surround = true,
          diffview = true,
          harpoon = true,
          fidget = true,
          indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
          },
        },
      }
      vim.cmd.colorscheme 'catppuccin-mocha'
    end,
  },
}
