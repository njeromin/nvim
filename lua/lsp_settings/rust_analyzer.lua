return function (lspconfig, config)
  local ok, rt = pcall(require, "rust-tools")

  if not ok then
    return lspconfig["rust_analyzer"].setup(config)
  end

  rt.setup(config)
end
