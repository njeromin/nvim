-- handlers
vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = {
      spacing = 5,
      severity_limit = 'Warning',
    },
    update_in_insert = true,
  }
)

-- setup neovim capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- set diagnostic icons
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = " ", texthl = "DiagnosticSignHint"})

local lspconfig = require("lspconfig")

local default_config = { capabilities = capabilities }

local function default_lsp_handler(server_name)
  local ok, setup = pcall(require, string.format("lsp_settings.%s", server_name))
  if ok then
    setup(lspconfig, default_config)
  else
    lspconfig[server_name].setup(default_config)
  end
end

require("mason-lspconfig").setup_handlers({ default_lsp_handler })
