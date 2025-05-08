return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  ft = { 'markdown', 'Avante' },
  opts = {
    completions = { blink = { enabled = true } },
    file_types = { 'markdown', 'Avante' },
  },
}
