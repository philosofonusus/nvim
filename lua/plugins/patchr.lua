return {
  'nhu/patchr.nvim',
  ---@type patchr.config
  opts = {
    plugins = {
      ['typescript-tools.nvim'] = {
        vim.fn.expand '~/.config/nvim/patches/typescript-tools.patch',
      },
    },
  },
}
