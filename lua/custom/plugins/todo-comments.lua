return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>ct', '<cmd>TodoTelescope<cr>', desc = 'Todo Telescope' },
      { '<leader>cq', '<cmd>TodoQuickFix<cr>', desc = 'Todo Quickfix' },
    },
    opts = { signs = false },
  },
}
