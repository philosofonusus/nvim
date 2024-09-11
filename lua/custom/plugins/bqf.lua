return {
  {
    'kevinhwang91/nvim-bqf',
    config = function()
      require('bqf').setup {
        winblend = 0,
      }
    end,
  },
  {
    'stevearc/qf_helper.nvim',
    opts = {},
  },
}
