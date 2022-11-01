require("auto-save").setup({
  condition = function (buf)
    local utils = require("auto-save.utils.data")

    if
      vim.fn.getbufvar(buf, "&modifiable") == 1 and
      utils.not_in(vim.fn.getbufvar(buf, "&buftype"), {
        "nofile",
      }) and
      utils.not_in(vim.fn.getbufvar(buf, "&filetype"), {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "neo-tree",
      })
    then
      return true
    end

    return false
  end
})
