return {
  {
    dir = '~/projects/morta',
    name = 'morta',
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'morta'
    end,
  },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     sources = {
  --       treesitter = true,
  --       treesitter_context = true,
  --       snacks = true,
  --       cmp = true,
  --       lazy = true,
  --     },
  --   },
  --   config = function()
  --     vim.cmd.colorscheme 'tokyonight-storm'
  --   end,
  -- },
}
