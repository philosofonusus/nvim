return {
  {
    'saghen/blink.compat',
    version = '*',
    lazy = true,
    opts = {},
  },
  {
    'saghen/blink.cmp',
    lazy = false,
    dependencies = {
      'rafamadriz/friendly-snippets',
      'supermaven-nvim',
      'saghen/blink.compat',
    },
    version = 'v0.*', -- use a release tag to download pre-built binaries
    opts = {
      keymap = {
        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-y>'] = { 'select_and_accept' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
      },
      signature = {
        enabled = true,
      },
      sources = {
        providers = {
          ecolog = { score_offset = 101, name = 'ecolog', module = 'ecolog.integrations.cmp.blink_cmp' },
          supermaven = { score_offset = 100, async = true, name = 'supermaven', module = 'blink.compat.source' },
        },
        default = { 'ecolog', 'supermaven', 'lsp', 'snippets', 'path', 'buffer' },
        per_filetype = {
          sql = { 'vim-dadbod-completion', 'buffer' },
        },
      },
      completion = {
        menu = {
          draw = {
            treesitter = { 'lsp' },
          },
        },
        documentation = {
          auto_show = true,
          treesitter_highlighting = true,
          auto_show_delay_ms = 0,
        },
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
      },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = 'rafamadriz/friendly-snippets',
    opts = { history = true, updateevents = 'TextChanged,TextChangedI' },
    config = function(_, opts)
      require('luasnip').config.set_config(opts)
      require('luasnip.loaders.from_vscode').lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
      require('luasnip.loaders.from_vscode').lazy_load { paths = vim.g.vscode_snippets_path or '' }
      require('luasnip.loaders.from_vscode').lazy_load { paths = { vim.fn.stdpath 'config' .. '/snippets' } }

      require('luasnip.loaders.from_snipmate').load()
      require('luasnip.loaders.from_snipmate').lazy_load { paths = vim.g.snipmate_snippets_path or '' }

      require('luasnip.loaders.from_lua').load()
      require('luasnip.loaders.from_lua').lazy_load { paths = vim.g.lua_snippets_path or '' }

      vim.api.nvim_create_autocmd('InsertLeave', {
        callback = function()
          if require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()] and not require('luasnip').session.jump_active then
            require('luasnip').unlink_current()
          end
        end,
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
