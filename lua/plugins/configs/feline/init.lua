local ok, feline = pcall(require, "feline")
if not ok then return end
local colours_ok, colours = pcall(require, "theme.colours")
if not colours_ok then return end
local darken = require("utils.colours").darken

local buf_not_empty = function ()
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
  return true
  end
  return false
end

local components = {
  active = { {}, {}, {} },
  inactive = { {}, {} },
}

local vi_mode = require("plugins.configs.feline.vi_mode")
components.active[1][1] = vi_mode.component

feline.setup({
  default_bg = darken(colours.bg, 5),
  default_fg = colours.fg,
  components = components,
  vi_mode_colors = vi_mode.colours,
})
