local M = {}

M.get_capabilities = function ()
  local cmp_nvim_ok, cmp_nvim = pcall(require, "cmp_nvim_lsp")
  if cmp_nvim_ok then return cmp_nvim.default_capabilities() end

  return vim.lsp.protocol.make_client_capabilities()
end

M.handlers = function ()
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

return M
