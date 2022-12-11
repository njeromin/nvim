local function get_capabilities()
  local cmp_nvim_ok, cmp_nvim = pcall(require, "cmp_nvim_lsp")
  if cmp_nvim_ok then return cmp_nvim.default_capabilities() end

  return vim.lsp.protocol.make_client_capabilities()
end

local function handlers()
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
end

local function module()
  local lspconfig = require("lspconfig")

  handlers()

  local default_config = { capabilities = get_capabilities() }

  local mason_lspconfig = require("mason-lspconfig")
  mason_lspconfig.setup()
  mason_lspconfig.setup_handlers({
    function (sname)
      local ok, handler = pcall(require, string.format("lsp_settings.%s", sname))
      if ok then
        pcall(handler, lspconfig, default_config)
      else
        lspconfig[sname].setup(default_config)
      end
    end
  })
end

return {
  loads_self = true,
  packer = {
    { "hrsh7th/cmp-nvim-lsp",
      disabled = not core.enabled_features["completion"],
    },
    { "williamboman/mason-lspconfig.nvim" },
    {
      "neovim/nvim-lspconfig",
      requires = {
        { "folke/neodev.nvim", module = "neodev" },
      },
      config = module,
    },
  },
}
