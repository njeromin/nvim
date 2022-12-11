return function (lspconfig, config)
  local ok, jdtls = pcall(require, "jdtls")
  if ok then
    config.on_attach = function (c, b) jdtls.setup_dap({ hotcodereplace = "auto" }) end
    jdtls.start_or_attach(config)
  else
    lspconfig["jdtls"].setup(config)
  end
end
