return {
  {
    'philosofonusus/ecolog.nvim',
    keys = {
      { '<leader>ge', '<cmd>EcologGoto<cr>', desc = 'Go to env file' },
      { '<leader>es', '<cmd>EcologSelect<cr>', desc = 'Switch env file' },
      { '<leader>ep', '<cmd>EcologPeek<cr>', desc = 'Ecolog peek env' },
    },
    dependencies = { 'nvim-telescope/telescope.nvim' },
    lazy = false,
    opts = {
      preferred_environment = 'local',
      shelter = {
        configuration = {
          partial_mode = {
            show_start = 3, -- Number of characters to show at start
            show_end = 3, -- Number of characters to show at end
            min_mask = 3, -- Minimum number of mask characters
          },
          shelter_char = '8',
        },
        modules = {
          files = true,
          cmp = true,
        },
      },
      path = vim.fn.getcwd(),
    },
  },
}
