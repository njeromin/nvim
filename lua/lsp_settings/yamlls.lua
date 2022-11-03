return function(lspconfig, config)
  import("yaml-companion", function (yc)
    config = yc.setup({
      lspconfig = config,
    })
  end)

  local ok, t = pcall(require, "telescope")
  if ok then pcall(t.load_extension, "yaml_schema") end

  lspconfig["yamlls"].setup(config)
end
