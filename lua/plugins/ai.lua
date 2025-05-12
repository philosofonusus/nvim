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
    'ravitemer/mcphub.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- uncomment the following line to load hub lazily
    --cmd = "MCPHub",  -- lazy load
    build = 'npm install -g mcp-hub@latest',
    config = function()
      require('mcphub').setup {
        extensions = {
          avante = {
            make_slash_commands = true,
          },
        },
      }
    end,
  },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
      provider = 'copilot',
      auto_suggestions_provider = 'copilot',
      copilot = {
        model = 'gemini-2.5-pro',
      },
      behaviour = { auto_suggestions = true, enable_cursor_planning_mode = true },
      hints = {
        enabled = false,
      },
      windows = {
        edit = {
          start_insert = false,
        },
        ask = {
          start_insert = false,
        },
        relativenumber = true,
      },
      file_selector = {
        provider = 'snacks',
      },
      disabled_tools = {
        'list_files',
        'search_files',
        'read_file',
        'create_file',
        'rename_file',
        'delete_file',
        'create_dir',
        'rename_dir',
        'delete_dir',
        'bash',
      },
      system_prompt = function()
        local hub = require('mcphub').get_hub_instance()
        return hub:get_active_servers_prompt()
      end,
      custom_tools = function()
        return {
          require('mcphub.extensions.avante').mcp_tool(),
        }
      end,
    },
    keys = {
      { '<leader>ax', '<cmd>AvanteClear<cr>', { desc = 'Avante clear chat history' } },
    },
    build = 'make',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'zbirenbaum/copilot.lua',
      'folke/snacks.nvim',
      'ravitemer/mcphub.nvim',
      'MeanderingProgrammer/render-markdown.nvim',
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
          },
        },
      },
    },
  },
}
