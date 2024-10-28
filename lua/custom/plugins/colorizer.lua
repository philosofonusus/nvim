return {
  {
    'echasnovski/mini.hipatterns',
    event = { 'BufReadPre', 'BufNewFile' }, -- Changed from LazyFile to standard events
    config = function(_, opts)
      local hi = require 'mini.hipatterns'

      -- Configure default options
      local config = {
        tailwind = {
          enabled = true,
          ft = {
            'astro',
            'css',
            'heex',
            'html',
            'html-eex',
            'javascript',
            'javascriptreact',
            'rust',
            'svelte',
            'typescript',
            'typescriptreact',
            'vue',
          },
          style = 'full', -- or "compact"
        },
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color { priority = 2000 },
          shorthand = {
            pattern = '()#%x%x%x()%f[^%x%w]',
            group = function(_, _, data)
              local match = data.full_match
              local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
              local hex_color = '#' .. r .. r .. g .. g .. b .. b
              return hi.compute_hex_color_group(hex_color, 'bg')
            end,
            extmark_opts = { priority = 2000 },
          },
        },
      }

      -- Handle Tailwind configuration
      if type(config.tailwind) == 'table' and config.tailwind.enabled then
        -- Reset hl groups when colorscheme changes
        vim.api.nvim_create_autocmd('ColorScheme', {
          callback = function()
            vim.b.hl = {}
          end,
        })

        config.highlighters.tailwind = {
          pattern = function()
            if not vim.tbl_contains(config.tailwind.ft, vim.bo.filetype) then
              return
            end
            if config.tailwind.style == 'full' then
              return '%f[%w:-]()[%w:-]+%-[a-z%-]+%-%d+()%f[^%w:-]'
            elseif config.tailwind.style == 'compact' then
              return '%f[%w:-][%w:-]+%-()[a-z%-]+%-%d+()%f[^%w:-]'
            end
          end,
          group = function(_, _, m)
            local match = m.full_match
            local color, shade = match:match '[%w-]+%-([a-z%-]+)%-(%d+)'
            shade = tonumber(shade)
            local colors = require('mini.hipatterns').colors
            local bg = vim.tbl_get(colors, color, shade)

            if bg then
              local hl = 'MiniHipatternsTailwind' .. color .. shade
              if not vim.b.hl or not vim.b.hl[hl] then
                vim.b.hl = vim.b.hl or {}
                vim.b.hl[hl] = true
                local bg_shade = shade == 500 and 950 or shade < 500 and 900 or 100
                local fg = vim.tbl_get(colors, color, bg_shade)
                vim.api.nvim_set_hl(0, hl, { bg = '#' .. bg, fg = '#' .. fg })
              end
              return hl
            end
          end,
          extmark_opts = { priority = 2000 },
        }
      end

      -- Setup the plugin with our configuration
      require('mini.hipatterns').setup(config)
    end,
  },
}
