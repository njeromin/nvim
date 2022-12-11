return function (lspconfig, config)
  local ok, neodev = pcall(require, "neodev")
  if ok then
    neodev.setup({
      lspconfig = false
    })
    config.before_init = require("neodev.lsp").before_init
  end

  lspconfig["sumneko_lua"].setup(vim.tbl_extend("keep", config, {
    settings = {
      Lua = {
        completion = {
          callSnippet = "replace",
        },
      },
    },
  }))
end
