_G.current_theme = _G.config.options.theme or "onedark"

local base16 = require("base16-colorscheme")
local hi = base16.highlight
local colours = require("theme.colours")
local utils = require("utils.colours")

-- nvim
local splitbg = utils.darken(colours.bg, 8)
hi.VertSplit = { guibg = splitbg, guifg = splitbg }
hi.WinSeparator = { guibg = splitbg, guifg = splitbg }

-- float
local floatbg = utils.darken(colours.bg, 5)
hi.Float = { guibg = floatbg }
hi.NormalFloat = { guibg = floatbg }
hi.WhichKeyFloat = { guibg = floatbg }

-- mason
local masonbg = floatbg
hi.MasonHeader = { guibg = colours.orange, guifg = "#111111" }
hi.MasonHighlight = { guifg = colours.blue }
hi.MasonHighlightBlock = { guifg = masonbg, guibg = colours.green }
hi.MasonHighlightBlockBold = { guifg = masonbg, guibg = colours.green }
hi.MasonHeaderSecondary = { guifg = masonbg, guibg = colours.magenta }
hi.MasonMuted = { guifg = colours.fg4 }
hi.MasonMutedBlock = { guifg = colours.fg4, bg = masonbg }

-- nvim tree
local treebg = utils.darken(colours.bg, 10)
hi.NvimTreeNormal = { guibg = treebg, right_padding = 1 }
hi.NvimTreeTitle = { guibg = treebg, guifg = colours.orange }
hi.NvimTreeWinSeparator = { guibg = treebg, guifg = treebg }
hi.NvimTreeFolderIcon = { guifg = colours.blue }
hi.NvimTreeFolderName = { guifg = colours.blue }

base16.setup(require("colors")[_G.current_theme])
