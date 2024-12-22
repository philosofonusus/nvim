return {
  {
    'supermaven-inc/supermaven-nvim',
    event = 'InsertEnter',
    cmd = {
      'SupermavenUseFree',
      'SupermavenUsePro',
    },
    config = function()
      require('supermaven-nvim').setup {
        -- disable_inline_completion = vim.g.ai_cmp,
        disable_inline_completion = true,
        keymaps = {
          accept_suggestion = nil,
        },
        ignore_filetypes = { 'bigfile', 'snacks_input', 'snacks_notif' },
        -- disable annoying startup message
        log_level = 'off',
      }
    end,
  },
}
