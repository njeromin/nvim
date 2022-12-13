local function module()
  local null = require("null-ls")
  local mason_null = require("mason-null-ls")
  mason_null.setup({})
  mason_null.setup_handlers({})
  null.setup({
    on_attach = function (client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = "LspFormatting", buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = "LspFormatting",
          buffer = bufnr,
          callback = function () vim.lsp.buf.format({ bufnr = bufnr }) end,
        })
      end
    end,
  })
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
