return {
  {
    'pmizio/typescript-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
    },
    opts = {},
    keys = {
      { '<leader>oi', '<cmd>TSToolsOrganizeImports<cr>', desc = 'Organize Imports' },
      { '<leader>ru', '<cmd>TSToolsOrganizeImports<cr>', desc = 'Remove unused statements' },
      { '<leader>ami', '<cmd>TSToolsAddMissingImports<cr>', desc = 'Add Missing Imports' },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      local api = require 'typescript-tools.api'
      require('typescript-tools').setup {
        capabilities = capabilities,
        handlers = {
          ['textDocument/publishDiagnostics'] = api.filter_diagnostics { 80006 },
        },
        settings = {
          jsx_close_tag = {
            enable = true,
            filetypes = { 'javascriptreact', 'typescriptreact' },
          },
          tsserver_plugins = {
            '@astrojs/ts-plugin',
          },
          tsserver_max_memory = 'auto',
        },
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false
        end,
        single_file_support = false,
        root_dir = function(fname)
          local root_pattern = require('lspconfig').util.root_pattern 'package.json'
          return root_pattern(fname)
        end,
        filetypes = {
          'typescript',
          'typescriptreact',
          'typescript.tsx',
        },
      }
    end,
  },
  {
    'dmmulroy/tsc.nvim',
    lazy = true,
    ft = { 'typescript', 'typescriptreact' },
    keys = { { '<leader>tc', '<cmd>TSC<cr>', desc = '[T]ypeScript [C]ompile' } },
    config = function()
      require('tsc').setup {
        use_trouble_qflist = true,
        auto_open_qflist = true,
        pretty_errors = false,
      }
    end,
  },
}
