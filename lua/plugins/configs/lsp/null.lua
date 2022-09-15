local ok, null = pcall(require, "null-ls")
if not ok then return end

local b = null.builtins

null.setup({
  sources = {
    b.formatting.stylua,
    b.diagnostics.selene,

    b.formatting.prettierd,
    b.formatting.rome,

    b.formatting.gofmt,
    b.formatting.goimports,
    b.formatting.golines,
  }
})
