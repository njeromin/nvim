local M = {}

M.get = function (name)
  local ok, hl = pcall(vim.api.nvim_get_hl_by_name, name, true)
  if not ok then return {} end
  for _, key in pairs({"foreground", "background", "special"}) do
    if hl[key] then hl[key] = string.format("#%06x", hl[key]) end
  end
  return hl
end

-- TODO: provide improvements to using vim.api.nvim_set_hl
M.set = function (name, vals)
  pcall(vim.api.nvim_set_hl, 0, name, vals)
end

return M
