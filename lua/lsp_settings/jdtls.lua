return function (lspconfig, config)
  local ok, jdtls = pcall(require, "jdtls")
  if ok then
    config.on_attach = function (_, _) jdtls.setup_dap({ hotcodereplace = "auto" }) end
    jdtls.start_or_attach(config)
  else
    lspconfig["jdtls"].setup(config)
  end
end
