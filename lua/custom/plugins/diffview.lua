return {
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>dv', '<cmd>DiffviewOpen<cr>' },
      { '<leader>df', '<cmd>DiffviewFileHistory %<cr>' },
      { '<leader>dc', '<cmd>set hidden<cr><cmd>DiffviewClose<cr><cmd>set nohidden<cr>' },
    },
    opts = {},
  },
}
