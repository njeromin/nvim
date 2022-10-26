local mason = require("mason")

mason.setup()

require("mason-lspconfig").setup({
  automatic_installation = true,
})
require("mason-null-ls").setup()
require("mason-nvim-dap").setup()
