local function module()
  local font_name = core.options.editor.font.name
  local font_size = core.options.editor.font.size
  vim.opt.guifont = string.format("%s:h%s", font_name, font_size)
end

return {
  module = module,
}
