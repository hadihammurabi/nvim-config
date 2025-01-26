local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.mapf(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

function M.snippet(direction)
  return function()
    if vim.snippet.active({ direction = 1 }) then
      return string.format('<Cmd>lua vim.snippet.jump(%d)<CR>', direction)
    else
      if direction > 0 then
        return '<Tab>'
      end
      return '<S-Tab>'
    end
  end
end

return M
