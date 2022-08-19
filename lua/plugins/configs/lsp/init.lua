require("plugins.configs.lsp.handlers")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local m_ok, masonlsp = pcall(require, "mason-lspconfig")
local l_ok, lspconfig = pcall(require, "lspconfig")
if not m_ok or not l_ok then return end

local default_config = {
  capabilities = capabilities,
}

local function default_handler(server_name, custom_opts)
  lspconfig[server_name].setup(vim.tbl_extend("keep", default_config, custom_opts or {}))
end

masonlsp.setup_handlers({
  default_handler,

  ["jsonls"] = function ()
    default_handler("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        }
      }
    })
  end,

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

  ["rust_analyzer"] = function ()
    require("rust-tools").setup(vim.tbl_extend("keep", default_config, {
    }))
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
