local function module()
  require("null-ls").setup()
  local mason_null = require("mason-null-ls")
  mason_null.setup({
    automatic_setup = true,
  })
  mason_null.setup_handlers()
end

return {
  loads_self = true,
  packer = {
    {
      "jay-babu/mason-null-ls.nvim",
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = module,
      module = "lspconfig", -- load when lspconfig loads
    }
  },
  requires = { "lsp" },
}
