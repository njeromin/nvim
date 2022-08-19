local M = {}

M.mason = function ()
  local ok, mason = pcall(require, "mason")
  if not ok then return end
  mason.setup()
end

M.mason_lspconfig = function ()
  local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not ok then return end
  mason_lspconfig.setup()
end

return M
