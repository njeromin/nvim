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
      },
    },
    indicator = {
      style = "none", -- "underline" | "none"
    },
    always_show_bufferline = true,
    close_command = close,
    middle_mouse_command = close,
    separator_style = "thin",
    show_close_icon = false,

    custom_areas = {
      right = function ()
        local res = {}

        table.insert(res, "test")

        return res
      end,
    },
  },
})
