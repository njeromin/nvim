local null = require("null-ls")
local mason_null = require("mason-null-ls")

-- format on write
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local function on_attach(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format {
          bufnr = bufnr,
        }
      end,
    })
  end
end

null.setup {
  sources = {
    -- TODO: move this into on_attach for rust lsp
    null.builtins.formatting.rustfmt,

    null.builtins.formatting.prettierd,
  },
  attach = on_attach,
}

local function attempt_register(t, source_name)
  local b = null.builtins[t][source_name]
  if b ~= nil then
    null.register(b)
  end
end

mason_null.setup_handlers {
  selene = function (n)
    attempt_register("diagnostics", n)
  end,
  stylua = function (n)
    attempt_register("formatting", n)
  end,
  --[[ eslint_d = function (n)
    attempt_register("code_actions", n)
    attempt_register("diagnostics", n)
    attempt_register("formatting", n)
  end, ]]
}
