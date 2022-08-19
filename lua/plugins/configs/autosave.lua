local autosave = require("auto-save")

autosave.setup({
  condition =function (buf)
    local utils = require("auto-save.utils.data")

    if
      vim.fn.getbufvar(buf, "&modifiable") == 1 and
      utils.not_in(vim.fn.getbufvar(buf, "&filetype"), {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "Mason",
        "NvimTree",
        "mason.nvim",
      })
    then
      return true
    end

    return false
  end
})
