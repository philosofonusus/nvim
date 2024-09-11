return {
  {
    'ThePrimeagen/harpoon',
    enabled = true,
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = function()
      local harpoon = require 'harpoon'
      return {
        {
          '<leader>h1',
          function()
            harpoon:list():select(1)
          end,
          desc = 'Go to harpoon mark 1',
        },
        {
          '<leader>h2',
          function()
            harpoon:list():select(2)
          end,
          desc = 'Go to harpoon mark 2',
        },
        {
          '<leader>h3',
          function()
            harpoon:list():select(3)
          end,
          desc = 'Go to harpoon mark 3',
        },
        {
          '<leader>h4',
          function()
            harpoon:list():select(4)
          end,
          desc = 'Go to harpoon mark 4',
        },
        {
          '<leader>hm',
          function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'Show harpoon marks',
        },
        {
          '<leader>ha',
          function()
            harpoon:list():add()
          end,
          desc = 'Add buffer to harpoon',
        },
        {
          '<leader>hd',
          function()
            harpoon:list():remove()
          end,
          desc = 'Add buffer to harpoon',
        },
      }
    end,
    config = function(_, opts)
      require('harpoon').setup(opts)
    end,
  },
}
