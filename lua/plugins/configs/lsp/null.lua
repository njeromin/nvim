local null = require("null-ls")

local b = null.builtins

null.setup({
  sources = {
    b.formatting.stylua,
    b.formatting.prettierd,
    b.formatting.rome,

    b.diagnostics.selene,
  }
})
