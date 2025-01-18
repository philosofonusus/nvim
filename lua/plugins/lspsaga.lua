return {
  {
    'nvimdev/lspsaga.nvim',
    event = 'LspAttach',
    keys = {
      { 'K', '<cmd>Lspsaga hover_doc<CR>', desc = 'Hover Doc' },
      -- { 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', desc = 'Hover doc' },
      -- { '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = 'Go to definition' },
      { '<leader>gd', '<cmd>Lspsaga goto_definition<CR>', desc = 'Go to definition' },
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
