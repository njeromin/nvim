require("plugins.configs.lsp.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local m_ok, masonlsp = pcall(require, "mason-lspconfig")
local l_ok, lspconfig = pcall(require, "lspconfig")
if not m_ok or not l_ok then return end

-- diagnostic icons
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", texthl = "DiagnosticSignHint"})

local default_config = {
  capabilities = capabilities,
}

local function default_handler(server_name)
  local ok, custom_setup = pcall(require, string.format("plugins.configs.lsp.settings.%s", server_name))
  if ok then
    custom_setup(lspconfig, default_config)
  else
    lspconfig[server_name].setup(default_config)
  end
end

masonlsp.setup_handlers({ default_handler })
