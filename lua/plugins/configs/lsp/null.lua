local null = require("null-ls")

local b = null.builtins

null.setup({
  sources = {
    b.formatting.stylua,
    b.diagnostics.selene,

    b.formatting.prettierd,
    b.formatting.rome,

    b.formatting.gofmt,
    b.formatting.goimports,
  }
})
