local base16 = require("base16-colorscheme")
local hi = base16.highlight
local colours = require("theme.colours")
local utils = require("utils.colours")

base16.setup(require("colors")[require("user.config").theme or "onedark"])

-- nvim
local splitbg = utils.darken(colours.bg, 10)
hi.VertSplit = { guifg = splitbg, guibg = splitbg }
hi.WinSeparator = { guifg = splitbg, guibg = splitbg }

-- float
local floatbg = utils.darken(colours.bg, 5)
hi.Float = { guibg = floatbg }
hi.FloatBorder = { guifg = floatbg, guibg = floatbg }
hi.FloatTitle = { guifg = colours.fg2, guibg = floatbg }
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

-- neo tree
local treebg = utils.darken(colours.bg, 10)
hi.NeoTreeNormal = { guibg = treebg }
hi.NeoTreeNormalNC = { guibg = treebg }
hi.NeoTreeRootName = { guifg = colours.orange }
hi.NeoTreeWinSeparator = { guifg = treebg, guibg = treebg }
hi.NeoTreeFloatBorder = { guifg = floatbg, guibg = floatbg }
hi.NeoTreeFloatTitle = { guifg = colours.bg4, guibg = floatbg }
hi.NeoTreeTabActive = { guibg = treebg }
hi.neoTreeTabSeparatorActive = { guifg = treebg, guibg = treebg }
local tree_tab_inactive = utils.darken(treebg, 10)
hi.NeoTreeTabInactive = { guibg = tree_tab_inactive }
hi.NeoTreeTabSeparatorInactive = { guifg = tree_tab_inactive, guibg = tree_tab_inactive }
