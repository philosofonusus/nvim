return {
  {
    'okuuva/auto-save.nvim',
    cmd = 'ASToggle', -- optional for lazy loading on command
    event = { 'InsertLeave', 'TextChanged' }, -- optional for lazy loading on trigger events
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

          if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbufvar(buf, '&filetype'), {}) then
            return true -- met condition(s), can save
          end
          return false -- can't save
        end,
      }
    end,
    debounce_delay = 250,
  },
}
