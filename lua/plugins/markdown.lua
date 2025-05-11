local ft = { 'markdown', 'Avante' }

return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  ft = ft,
  opts = {
    completions = { blink = { enabled = true } },
    file_types = ft,
  },
}
