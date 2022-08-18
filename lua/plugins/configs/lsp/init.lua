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
  lspconfig[server_name].setup(vim.tbl_extend("keep", default_config, custom_opts or {}))
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
  end,

  ["arduino_language_server"] = function ()
    default_handler("arduino_language_server", {
      cmd = {
        "arduino-language-server",
        "-cli-config", "",
        "-fqbn", "arduino:avr:uno",
        "-cli", "arduino-cli",
        "-clangd", "clangd",
      },
    })
  end
})
