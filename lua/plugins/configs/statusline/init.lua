local el = require("el")
local builtin = require("el.builtin")
local extensions = require('el.extensions')
local subscribe = require('el.subscribe')
local utils = require("plugins.configs.statusline.utils")

group("StatusLine", { fg = colours.fg, bg = darken(colours.bg, 2) })
group("StatusLineNC", { bg = groups.StatusLine.bg })
group("SL_Light", { fg = colours.fg, bg = lighten(groups.StatusLine.bg, 4)  })
group("SL_Sep1", { link = "SL_Mode" })
group("SL_Sep2", { fg = groups.SL_Light.bg, bg = groups.StatusLine.bg })

local function generator(window, buffer)
  local segments = {}

  table.insert(segments, require("plugins.configs.statusline.comps.mode"))

  table.insert(segments, utils.sep("tri_left", "SL_Sep1"))
  table.insert(segments, "%#SL_Light# ")
  table.insert(segments,
    subscribe.buf_autocmd(
      "el_file_icon",
      "BufRead",
      function(_, buf)
        return extensions.file_icon(_, buf)
      end
    )
  )
  table.insert(segments, " ")
  table.insert(segments, builtin.tail_file)
  table.insert(segments, builtin.modified)
  table.insert(segments, " ")
  table.insert(segments, utils.sep("tri_right", "SL_Sep2"))
  table.insert(segments, utils.reset())

  table.insert(segments, "%=")
  
  table.insert(segments, utils.sep("tri_left", "SL_Sep2"))
  table.insert(segments, "%#SL_Light#")
  table.insert(segments, " ")
  table.insert(segments, builtin.column)
  table.insert(segments, ":")
  table.insert(segments, builtin.line)
  table.insert(segments, " ")

  return segments
end

el.setup({
  generator = generator,
})
