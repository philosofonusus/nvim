return {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    lazy = false,
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    'Goose97/timber.nvim',
    event = 'VeryLazy',
    config = function()
      require('timber').setup {
        log_watcher = {
          enabled = true,
          sources = {},
          preview_snippet_length = 32,
        },
      }
    end,
  },
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
