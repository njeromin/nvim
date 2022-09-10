local colours = require("theme.colours") or {}
local utils = require("utils.colours")

local normal_bg = utils.darken(colours.bg.base, 5)
local preview_bg = utils.darken(colours.bg.base, 10)
return {
  TelescopeBorder = { fg = normal_bg, bg = normal_bg },
  TelescopeTitle = { fg = "#111111", bg = colours.blue },
  TelescopeNormal = { bg = normal_bg },

  TelescopeResultsNormal = { bg = normal_bg },
  TelescopeResultsTitle = { fg = "#111111", bg = colours.green },

  TelescopePreviewBorder = { fg = preview_bg, bg = preview_bg },
  TelescopePreviewTitle = { fg = "#111111", bg = colours.red },
  TelescopePreviewNormal = { bg = preview_bg },

  TelescopePromptBorder = { fg = normal_bg, bg = normal_bg },
  TelescopePromptTitle = { fg = "#111111", bg = colours.blue },
  TelescopePromptNormal = { bg = normal_bg },
}
