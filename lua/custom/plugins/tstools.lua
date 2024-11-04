return {
  {
    'pmizio/typescript-tools.nvim',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
    keys = {
      { '<leader>oi', '<cmd>TSToolsOrganizeImports<cr>', desc = 'Organize Imports' },
      { '<leader>ru', '<cmd>TSToolsOrganizeImports<cr>', desc = 'Remove unused statements' },
      { '<leader>ami', '<cmd>TSToolsAddMissingImports<cr>', desc = 'Add Missing Imports' },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      local api = require 'typescript-tools.api'
      require('typescript-tools').setup {
        handlers = {
          ['textDocument/publishDiagnostics'] = api.filter_diagnostics { 80006 },
        },
        single_file_support = false,
        root_dir = function(fname)
          local root_pattern = require('lspconfig').util.root_pattern 'package.json'
          return root_pattern(fname)
        end,
        file_types = {
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
      }
    end,
  },
}
