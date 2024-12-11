return {
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
}
