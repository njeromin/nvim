local el = require("el")
local extensions = require("el.extensions")
local subscribe = require("el.subscribe")
local builtin = require("el.builtin")
local utils = require("plugins.configs.statusline.utils")

group("StatusLine", { fg = colours.fg, bg = darken(colours.bg, 2) })
group("StatusLineNC", { bg = groups.StatusLine.bg })

local function generator(window, buffer)
  local segments = {}

  table.insert(segments, require("plugins.configs.statusline.comps.mode"))
  table.insert(segments, " ")
  table.insert(segments, builtin.tail_file)

  return segments
end

el.setup({
  generator = generator,
})
