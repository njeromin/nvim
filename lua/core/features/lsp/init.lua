local function module()
  local utils = require("core.features.lsp.utils")
  local lspconfig = require("lspconfig")

  utils.handlers()

  local default_config = { capabilities = utils.get_capabilities() }

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
        { "mfussenegger/nvim-jdtls", module = "jdtls" },
        { "folke/neodev.nvim", module = "neodev" },
        { "simrat39/rust-tools.nvim", module = "rust-tools" }
      },
      config = module,
    },
  },
}
