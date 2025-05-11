local M = {}

---LSPSaga helper to check for peek definition window
---@param bufnr number The buffer number to check.
---@return boolean true if the buffer should be linted, false otherwise.
function M.is_lspsaga_peek_window(bufnr)
  local filetype = vim.bo[bufnr].filetype
  local buftype = vim.bo[bufnr].buftype
  local modifiable = vim.bo[bufnr].modifiable

  if (filetype == 'markdown' or filetype == 'markdown.mdx') and buftype == 'nofile' and not modifiable then
    return true
  end

  return false
end

return M
