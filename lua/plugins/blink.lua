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
      'saghen/blink.compat',
      'giuxtaposition/blink-cmp-copilot',
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
        kind_icons = {
          Copilot = '',
          Text = '󰉿',
          Method = '󰊕',
          Function = '󰊕',
          Constructor = '󰒓',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '󱡠',
          Interface = '󱡠',
          Struct = '󱡠',
          Module = '󰅩',

          Unit = '󰪚',
          Value = '󰦨',
          Enum = '󰦨',
          EnumMember = '󰦨',

          Keyword = '󰻾',
          Constant = '󰏿',

          Snippet = '󱄽',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '󰉋',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        },
      },
      signature = {
        enabled = true,
      },
      sources = {
        providers = {
          ecolog = { score_offset = 102, name = 'ecolog', module = 'ecolog.integrations.cmp.blink_cmp' },
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = 'Copilot'
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
        default = { 'ecolog', 'copilot', 'lsp', 'snippets', 'path', 'buffer' },
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
