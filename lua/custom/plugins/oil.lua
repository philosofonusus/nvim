return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '<C-n>', '<cmd>Oil<cr>', desc = 'Open parent directory' },
    },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        delete_to_trash = true,
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
          natural_order = true,

          is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
          end,
        },
      }

      if vim.fn.argv(0) == '' then
        vim.cmd 'Oil'
      end
    end,
    lazy = false,
  },
}
