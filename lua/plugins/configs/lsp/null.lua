local ok, null = pcall(require, "null-ls")
if not ok then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local b = null.builtins

null.setup({
  sources = {
    -- b.formatting.stylua,
    -- b.diagnostics.selene,

    b.formatting.prettierd,
    b.formatting.rome,

    b.formatting.gofmt,
    b.formatting.goimports,
     b.formatting.golines,
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({
            bufnr = bufnr,
          })
        end
      })
    end
  end
})
