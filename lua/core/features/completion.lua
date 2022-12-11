local function module()
  local cmp = require("cmp")

  local sources = {
    core.loaded_features["lsp"] and { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  }

  cmp.setup({
    snippet = {},
    window = {},
    sources = cmp.config.sources(sources)
  })
end

return {
  loads_self = true,
  packer = {
    {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
      config = module,
    },
  },
}
