return function (lspconfig, default_config)
  local config = {
    cmd = {
      "arduino-language-server",
      "-cli-config", string.format("%s/arduino-cli.yaml", tostring(vim.g.arduino_dir or os.getenv("HOME").."/.arduino15")),
      "-fqbn", "aruino:avr:uno",
      "-cli", "arduino-cli",
      "-clangd", "clangd",
    },
  }

  lspconfig["arduino_language_server"].setup(vim.tbl_extend("keep", default_config, config))
end
