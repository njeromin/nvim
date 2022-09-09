return function (lspconfig, default_config)
  local ok, go = pcall(require, "go")
  if ok then
    go.setup()
  end
  lspconfig["gopls"].setup(default_config)
end
