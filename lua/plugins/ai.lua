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
        '<Leader>ac',
        '<cmd>CodeCompanionChat Toggle<CR>',
        {
          description = 'toggle a chat buffer',
        },
        mode = { 'n', 'v' },
      },
      {
        '<LocalLeader>ac',
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
                default = 'gemini-2.5-pro',
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
            ['git_files'] = {
              description = 'List git files',
              ---@param chat CodeCompanion.Chat
              callback = function(chat)
                local handle = io.popen 'git ls-files'
                if handle ~= nil then
                  local result = handle:read '*a'
                  handle:close()
                  chat:add_reference({ role = 'user', content = result }, 'git', '<git_files>')
                else
                  return vim.notify('No git files available', vim.log.levels.INFO, { title = 'CodeCompanion' })
                end
              end,
              opts = {
                contains_code = false,
              },
            },
            ['file'] = {
              callback = 'strategies.chat.slash_commands.file',
              description = 'Select a file using Snacks picker',
              opts = {
                provider = 'snacks',
                contains_code = true,
              },
            },
            ['help'] = {
              opts = {
                max_lines = 1000,
              },
            },
          },
        },
        inline = {
          adapter = 'copilot',
          keymaps = {
            accept_change = {
              modes = { n = 'ga' },
              description = 'Accept the suggested change',
            },
            reject_change = {
              modes = { n = 'gr' },
              description = 'Reject the suggested change',
            },
          },
        },
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
