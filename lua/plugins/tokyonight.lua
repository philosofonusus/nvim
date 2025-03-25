return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      sources = {
        neotest = true,
        mini_hipatterns = true,
        supermaven = true,
        treesitter = true,
        treesitter_context = true,
        snacks = true,
        blink = true,
        gitsigns = true,
        trouble = true,
        ['which-key'] = true,
        lazy = true,
      },
    },
    config = function()
      vim.cmd.colorscheme 'tokyonight-storm'
    end,
  },
}
