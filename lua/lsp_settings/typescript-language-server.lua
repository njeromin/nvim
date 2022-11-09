return function (lspconfig, config)
  local ok, ts = pcall(require, "typescript")

  if ok then
    ts.setup({
      server = config
    })
  else
    lspconfig["typescript-language-server"].setup(config)
  end
end
