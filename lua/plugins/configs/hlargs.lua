local ok, hlargs = pcall(require, "hlargs")
if not ok then return end
local c_ok, colours = pcall(require, "theme.colours")
if not c_ok then return end
local u_ok, utils = pcall(require, "utils.colours")
if not u_ok then return end

hlargs.setup({
  color = utils.darken(colours.red, 15),
})
