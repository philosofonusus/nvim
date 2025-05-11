return {
  {
    dir = '~/projects/morta.nvim',
    name = 'morta',
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme 'morta'
    end,
  },
}
