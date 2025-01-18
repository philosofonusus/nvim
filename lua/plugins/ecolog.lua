return {
  {
    dir = '~/projects/ecolog.nvim',
    keys = {
      { '<leader>ge', '<cmd>EcologGoto<cr>', desc = 'Go to env file' },
      { '<leader>ec', '<cmd>EcologSnacks<cr>', desc = 'Open a picker' },
      { '<leader>eS', '<cmd>EcologSelect<cr>', desc = 'Switch env file' },
      { '<leader>es', '<cmd>EcologShelterToggle<cr>', desc = 'Ecolog shelter toggle' },
    },
    lazy = false,
    opts = {
      preferred_environment = 'local',
      types = true,
      integrations = {
        lspsaga = true,
        nvim_cmp = true,
        statusline = {
          hidden_mode = true,
        },
        snacks = true,
      },
      shelter = {
        configuration = {
          sources = {
            ['.env.example'] = 'none',
          },
          partial_mode = {
            min_mask = 5,
            show_start = 1,
            show_end = 1,
          },
          mask_char = '*',
        },
        modules = {
          files = true,
          peek = false,
          snacks_previewer = true,
          snacks = false,
          cmp = true,
        },
      },
      path = vim.fn.getcwd(),
    },
  },
}
