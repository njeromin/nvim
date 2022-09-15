local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local m_ok, masonlsp = pcall(require, "mason-lspconfig")
local l_ok, lspconfig = pcall(require, "lspconfig")
if not m_ok or not l_ok then return end

-- diagnostic icons
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", texthl = "DiagnosticSignHint"})

local default_config = { capabilities = capabilities }

local custom = require("core.custom")

local function default_handler(server_name)
  local config = default_config
  local clc_ok, custom_lsp_config = pcall(custom.load_lsp_settings, server_name)
  if clc_ok then config = vim.tbl_extend("keep", custom_lsp_config, default_config) end

  local ok, custom_setup = pcall(require, string.format("plugins.configs.lsp.settings.%s", server_name))
  if ok then
    custom_setup(lspconfig, config)
  else
    lspconfig[server_name].setup(config)
  end
end

masonlsp.setup_handlers({ default_handler })

require("plugins.configs.lsp.handlers")
