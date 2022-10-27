local function close(bufnr)
  require("bufdelete").bufdelete(bufnr, true)
end

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    offsets = {
      {
        filetype = "neo-tree",
        text = "",
        highlight = "NeoTreeNormal",
        separator = true,
      }
    },
    indicator = {
      --style = "underline",
    },
    always_show_bufferline = false,
    close_command = close,
    middle_mouse_command =  close,
    separator_style = "thin",
  },
})
