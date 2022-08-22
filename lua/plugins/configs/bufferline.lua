local ok, bufline = pcall(require, "bufferline")
if not ok then return end

bufline.setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    offsets = {
      --[[ {
        filetype = "neo-tree",
        text = function ()
          return ""
        end,
        highlight = "NeoTreeNormal",
        text_align = "left",
      } ]]
    },
    always_show_bufferline = false,
  },
})
