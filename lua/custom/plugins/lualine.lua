return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
        },
        extensions = {
          'lazy',
          'quickfix',
          'oil',
          'fugitive',
          'trouble',
        },
        sections = {
          lualine_c = {
            'filename',
            {
              'harpoon2',
              icon = '󰛢',
              indicators = { '1', '2', '3', '4' },
              active_indicators = { '[1]', '[2]', '[3]', '[4]' },
              color_active = { fg = '#D0A8E5' },
              _separator = ' ',
              no_harpoon = 'Harpoon not loaded',
            },
          },
        },
      }
    end,
  },
  {
    'letieu/harpoon-lualine',
    dependencies = {
      {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
      },
    },
  },
}
