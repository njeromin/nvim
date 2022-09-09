return function (lspconfig, default_config)
  local ok, rt = pcall(require, "rust-tools")
  if not ok then
    return lspconfig["rust_analyzer"].setup(default_config)
  end

  rt.setup(default_config)
end
