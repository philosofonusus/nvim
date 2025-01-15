return {
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    keys = {
      { 'K', '<cmd>Lspsaga hover_doc<CR>', desc = 'Hover Doc' },
      -- { '<leader>gd', '<cmd>Lspsaga goto_definition<CR>', desc = 'Go to definition' },
      -- { '<leader>gf', '<cmd>Lspsaga finder<CR>', desc = 'LSP Finder' },
      { '<leader>rn', '<cmd>Lspsaga rename<CR>', desc = 'Rename' },
      { '<leager>gp', '<cmd>Lspsaga peek_definition<CR>', desc = 'Preview Definition' },
      -- { '<leader>gt', '<cmd>Lspsaga goto_type_definition<CR>', desc = 'Go to type definition' },
      { '<leader>ol', '<cmd>Lspsaga outline<CR>', desc = 'Outline' },
    },
    config = function()
      require('lspsaga').setup {
        lightbulb = {
          sign = false,
        },
      }
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
  },
}
