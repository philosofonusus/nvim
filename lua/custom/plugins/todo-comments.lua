return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = 'Todo Telescope' },
      { '<leader>tq', '<cmd>TodoQuickFix<cr>', desc = 'Todo Quickfix' },
    },
    opts = { signs = false },
  },
}
