return function (lspconfig, config)
  import("neodev", function (nd) nd.setup() end)
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
