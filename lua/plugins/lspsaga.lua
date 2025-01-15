return {
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    keys = {
      { 'K', '<cmd>Lspsaga hover_doc<CR>', desc = 'Hover Doc' },
      { '<leader>rn', '<cmd>Lspsaga rename<CR>', desc = 'Rename' },
      { '<leager>gp', '<cmd>Lspsaga peek_definition<CR>', desc = 'Preview Definition' },
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
