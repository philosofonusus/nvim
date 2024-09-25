-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- open help in horizontal split
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('vertical_help', { clear = true }),
  pattern = 'help',
  callback = function()
    vim.bo.bufhidden = 'unload'
    vim.cmd.wincmd 'L'
    vim.cmd.wincmd '='
  end,
})

-- disable auto commenting for new line
vim.api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
-- It seems that `checktime` does not work in command line. We need to check if we are in command
-- line before executing this command, see also https://vi.stackexchange.com/a/20397/15292 .
vim.api.nvim_create_augroup('auto_read', { clear = true })

vim.api.nvim_create_autocmd({ 'FileChangedShellPost' }, {
  pattern = '*',
  group = 'auto_read',
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded!', vim.log.levels.WARN, { title = 'nvim-config' })
  end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'CursorHold' }, {
  pattern = '*',
  group = 'auto_read',
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd 'checktime'
    end
  end,
})

-- Do not use smart case in command line mode, extracted from https://vi.stackexchange.com/a/16511/15292.
vim.api.nvim_create_augroup('dynamic_smartcase', { clear = true })
vim.api.nvim_create_autocmd('CmdLineEnter', {
  group = 'dynamic_smartcase',
  pattern = ':',
  callback = function()
    vim.o.smartcase = false
  end,
})

vim.api.nvim_create_autocmd('CmdLineLeave', {
  group = 'dynamic_smartcase',
  pattern = ':',
  callback = function()
    vim.o.smartcase = true
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('term_start', { clear = true }),
  pattern = '*',
  callback = function()
    -- Do not use number and relative number for terminal inside nvim
    vim.wo.relativenumber = false
    vim.wo.number = false

    -- Go to insert mode by default to start typing command
    vim.cmd 'startinsert'
  end,
})
