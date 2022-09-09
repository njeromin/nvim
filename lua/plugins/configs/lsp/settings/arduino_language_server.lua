return function (lspconfig, default_config)
  local config = {
    cmd = {
      "arduino-language-server",
      "-cli-config", "",
      "-fqbn", "aruino:avr:uno",
      "-cli", "arduino-cli",
      "-clangd", "clangd",
    },
  }

  lspconfig["arduino_language_server"].setup(vim.tbl_extend("keep", default_config, config))
end
