return {
  {
    dir = '~/projects/ecolog.nvim',
    keys = {
      { '<leader>ge', '<cmd>EcologGoto<cr>', desc = 'Go to env file' },
      { '<leader>eS', '<cmd>EcologSelect<cr>', desc = 'Switch env file' },
      { '<leader>es', '<cmd>EcologShelterToggle<cr>', desc = 'Ecolog shelter toggle' },
    },
    dependencies = { 'nvim-telescope/telescope.nvim' },
    lazy = false,
    opts = {
      preferred_environment = 'local',
      types = true,
      integrations = {
        lspsaga = true,
        -- BLINK-CMP uncomment two lines below
        -- blink_cmp = true,
        nvim_cmp = true,
      },
      shelter = {
        configuration = {
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
          telescope = true,
          cmp = true,
        },
      },
      path = vim.fn.getcwd(),
    },
  },
}
