return {
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm ci && npm run build',
    event = 'BufEnter',
    config = function()
      require('tailwind-sorter').setup {
        on_save_enabled = true, -- If `true`, automatically enables on save sorting.
        trim_spaces = true,
        on_save_pattern = { '*.html', '*.js', '*.jsx', '*.tsx', '*.twig', '*.hbs', '*.php', '*.heex', '*.astro' }, -- The file patterns to watch and sort.
        node_path = 'node',
      }
    end,
  },
}
