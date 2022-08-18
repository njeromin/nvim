-- make sure mason lspconfig is installed
if not packer_plugins["mason-lspconfig.nvim"] then return end

require("plugins.configs.lsp.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local masonlsp = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local default_config = {
  capabilities = capabilities,
}

local function default_handler(server_name, custom_opts)
  local config = default_config

  if custom_opts then
    vim.tbl_extend("keep", config, custom_opts)
  end

  lspconfig[server_name].setup(config)
end

masonlsp.setup_handlers({
  default_handler,

  ["sumneko_lua"] = function ()
    local luadev = require("lua-dev").setup({
      library = {
        vimruntime = true,
        types = true,
        plugins = true,
      },
      runtime_path = true,
    })
    default_handler("sumneko_lua", luadev)
  end
})
