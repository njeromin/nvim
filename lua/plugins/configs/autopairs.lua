require("nvim-autopairs").setup({
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt" },
})

local cmp_ok, cmp = pcall(require, "cmp")
if cmp_ok then
  cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } }))
end
