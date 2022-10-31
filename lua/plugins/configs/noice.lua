require("noice").setup({
  cmdline = {
    format = {
      cmdline = { pattern = "^:", icon = "", lang = "vim" },
    },
  },
  lsp = {
    progress = {
      enabled = false,
    },
  },
  presets = {
    long_message_to_split = true,
    inc_rename = true,
  },
})
