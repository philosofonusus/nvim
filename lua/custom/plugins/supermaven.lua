return {
  {
    'supermaven-inc/supermaven-nvim',
    event = 'VeryLazy',
    config = function()
      require('supermaven-nvim').setup {
        disable_inline_completion = true,
      }
    end,
  },
}
