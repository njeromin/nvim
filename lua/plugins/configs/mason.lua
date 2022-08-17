local M = {}

M.mason = function ()
  local mason = require("mason")
  mason.setup()
end

M.mason_lspconfig = function ()
  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup()
end

return M
