return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = true,
        },
        -- copilot_model = 'gpt-4o-copilot',
      }
    end,
  },
  {
    'olimorris/codecompanion.nvim',
    keys = {
      {
        '<Leader>aa',
        '<cmd>CodeCompanionChat Toggle<CR>',
        {
          description = 'toggle a chat buffer',
        },
        mode = { 'n', 'v' },
      },
      {
        '<LocalLeader>aa',
        '<cmd>CodeCompanionChat Add<CR>',
        { description = 'Add code to a chat buffer' },
        mode = { 'v' },
      },
    },
    opts = {
      adapters = {
        copilot = function()
          return require('codecompanion.adapters').extend('copilot', {
            schema = {
              model = {
                default = 'claude-3.7-sonnet',
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'copilot',
          start_in_insert_mode = false,
          roles = {
            user = 'tentacles',
          },
          slash_commands = {
            ['help'] = {
              opts = {
                max_lines = 1000,
              },
            },
          },
          tools = {
            opts = {
              auto_submit_success = false,
              auto_submit_errors = false,
            },
          },
        },
        inline = { adapter = 'copilot' },
      },
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = 'gh',
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = 'snacks',
            enable_logging = false,
            dir_to_save = vim.fn.stdpath 'data' .. '/codecompanion-history',
          },
        },
        vectorcode = {
          opts = {
            add_tool = true,
          },
        },

        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
      'j-hui/fidget.nvim',
      'ravitemer/codecompanion-history.nvim', -- Save and load conversation history
      {
        'ravitemer/mcphub.nvim', -- Manage MCP servers
        cmd = 'MCPHub',
        build = 'npm install -g mcp-hub@latest',
        config = true,
      },
      {
        'Davidyz/VectorCode', -- Index and search code in your repositories
        version = '*',
        build = 'pipx upgrade vectorcode',
        dependencies = { 'nvim-lua/plenary.nvim' },
      },
    },
  },
}
