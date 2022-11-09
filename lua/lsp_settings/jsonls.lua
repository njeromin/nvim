return function (lspconfig, default_config)
  local config = {
    settings = {
      json = {},
    },
  }

  import("schemastore", function (schemastore)
    config.settings.json.schemas = schemastore.json.schemas()
    config.settings.json.validate = { enable = true }
  end)

  lspconfig["jsonls"].setup(vim.tbl_extend("keep", default_config, config))
end
