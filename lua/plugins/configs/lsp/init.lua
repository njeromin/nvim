-- make sure mason lspconfig is installed
if not packer_plugins["mason-lspconfig.nvim"] then return end

require("plugins.configs.lsp.handlers")

local capabilities = vim.lsp.protocol.make_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local masonlsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local default_config = {
  capabilities = capabilities,
}

local function default_handler(server_name, custom_opts)
  local config = default_config

  if type(custom_opts) == "table" then
    config = require("utils").combineTables(config, custom_opts)
  end

  lspconfig[server_name].setup(config)
end

masonlsp.setup_handlers({
  default_handler,

})
