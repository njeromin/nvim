-- setup neovim capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
import("cmp_nvim_lsp", function (cmp)
  capabilities = cmp.update_capabilities(capabilities)
end)

-- set diagnostic icons
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", texthl = "DiagnosticSignHint"})
 
local lspconfig = require("lspconfig")

local default_config = { capabilities = capabilities }

local function default_lsp_handler(server_name)
  local ok, setup = pcall(require, string.format("lsp.settings.%s", server_name))
  if ok then 
    setup(lspconfig, default_config)
  else
    lspconfig[server_name].setup(default_config)
  end
end

require("mason-lspconfig").setup_handlers({ default_lsp_handler })
