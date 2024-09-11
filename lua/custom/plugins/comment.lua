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
      vim.keymap.set('n', '<leader>/', 'gcc', { desc = 'Toggle Comment', remap = true })
      vim.keymap.set('v', '<leader>/', 'gc', { desc = 'Toggle comment', remap = true })
    end,
  },
}
