return {
  {
    'windwp/nvim-autopairs',
    opts = {
      fast_wrap = {},
      disable_filetype = { 'snacks_picker_input', 'vim' },
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)
    end,
  },
  -- {
  --   dir = '~/projects/blink.pairs',
  --   build = 'cargo build --release',
  --   --- @module 'blink.pairs'
  --   --- @type blink.pairs.Config
  --   opts = {
  --     mappings = {
  --       enabled = true,
  --       pairs = {},
  --     },
  --     highlights = {
  --       enabled = true,
  --       groups = {
  --         'BlinkPairsOrange',
  --         'BlinkPairsPurple',
  --         'BlinkPairsBlue',
  --       },
  --       matchparen = {
  --         enabled = true, -- Enable matchparen functionality
  --         group = 'MatchParen', -- Highlight group for matching pairs
  --         priority = 250, -- Priority of the highlight (higher than regular pairs)
  --       },
  --     },
  --     debug = true,
  --   },
  -- },
}
