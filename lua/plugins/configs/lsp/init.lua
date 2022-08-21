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

local default_attach = function (client, bufnr) end

local default_config = {
  capabilities = capabilities,
  on_attach = default_attach,
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
      lspconfig = vim.tbl_extend("keep", default_config, {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
          },
        },
      }),
    })
    default_handler("sumneko_lua", luadev)
  end,

  ["rust_analyzer"] = function ()
    local ok, rt = pcall(require, "rust-tools")
    if ok then
      rt.setup(default_config)
    else
      default_handler("rust_analyzer")
    end
  end,

  ["gopls"] = function ()
    local ok, go = pcall(require, "go")
    if ok then go.setup() end
    default_handler("gopls")
  end,

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
