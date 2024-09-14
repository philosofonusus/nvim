return {
  {
    'dmmulroy/tsc.nvim',
    lazy = true,
    ft = { 'typescript', 'typescriptreact' },
    config = function()
      require('tsc').setup {
        use_trouble_qflist = true,
        auto_open_qflist = true,
        pretty_errors = false,
      }
    end,
  },
}
