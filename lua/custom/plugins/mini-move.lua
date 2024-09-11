return {
  {
    'echasnovski/mini.move',
    opts = {
      mappings = {
        left = '<S-left>',
        right = '<S-right>',
        down = '<S-down>',
        up = '<S-up>',
        line_left = '<S-left>',
        line_right = '<S-right>',
        line_down = '<S-down>',
        line_up = '<S-up>',
      },
    },
    config = function(_, opts)
      require('mini.move').setup(opts)
    end,
    event = 'VeryLazy',
  },
}
