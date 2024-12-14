return {
  {
    'okuuva/auto-save.nvim',
    cmd = 'ASToggle',
    event = { 'InsertLeave', 'TextChanged' },
    config = function()
      require('auto-save').setup {
        condition = function(buf)
          local fn = vim.fn
          local utils = require 'auto-save.utils.data'
          if pcall(function()
            return vim.bo[buf].buftype
          end) then
            if vim.bo[buf].buftype ~= '' then
              return false
            end
          else
            return false
          end

          if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), { 'sql' }) then
            return true
          end
          return false
        end,
      }
    end,
    debounce_delay = 250,
  },
}
