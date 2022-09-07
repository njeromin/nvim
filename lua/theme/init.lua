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
hi.Float = { guifg = colours.fg, guibg = floatbg }
hi.FloatBorder = { guifg = floatbg, guibg = floatbg }
hi.FloatTitle = { guifg = "#111111", guibg = colours.orange }
hi.NormalFloat = { guibg = floatbg }
hi.WhichKeyFloat = { guibg = floatbg }

-- nvim-cmp
hi.CmpNormal = { guifg = colours.fg, guibg = utils.lighten(colours.bg, 6) }
hi.CmpCursor = { guifg = "NONE", guibg = utils.lighten(colours.bg, 12) }

hi.CmpItemAbbrDeprecated = { guifg = colours.fg2, guibg = "NONE", fmt = "strikethrough" }
hi.CmpItemAbbrMatch = { guifg = colours.blue, guibg = "NONE", fmt = "bold" }
hi.CmpItemAbbrMatchFuzzy = { guifg = colours.blue, guibg = "NONE", fmt = "bold" }
hi.CmpItemMenu = { guifg = utils.darken(colours.fg, 10), guibg = "NONE", fmt = "italic" }

local cmp_item_1 = { guifg = "#ffffff", guibg = colours.red }
hi.CmpItemKindField = cmp_item_1
hi.CmpItemKindProperty = cmp_item_1
hi.CmpItemKindEvent = cmp_item_1

local cmp_item_2 = { guifg = "#ffffff", guibg = colours.green }
hi.CmpItemKindText = cmp_item_2
hi.CmpItemKindEnum = cmp_item_2
hi.CmpItemKindKeyword = cmp_item_2

local cmp_item_3 = { guifg = "#ffffff", guibg = colours.orange }
hi.CmpItemKindConstant = cmp_item_3
hi.CmpItemKindConstructor = cmp_item_3
hi.CmpItemKindReference = cmp_item_3

local cmp_item_4 = { guifg = "#ffffff", guibg = colours.magenta }
hi.CmpItemKindFunction =  cmp_item_4
hi.CmpItemKindStruct = cmp_item_4
hi.CmpItemKindClass = cmp_item_4
hi.CmpItemKindModule = cmp_item_4
hi.CmpItemKindOperator = cmp_item_4

local cmp_item_5 = { guifg = "#ffffff", guibg = colours.fg3 }
hi.CmpItemKindVariable = cmp_item_5
hi.CmpItemKindFile = cmp_item_5

local cmp_item_6_bg = utils.darken(colours.brown, 15)
local cmp_item_6 = { guifg = "#ffffff", guibg = cmp_item_6_bg }
hi.CmpItemKindUnit = cmp_item_6
hi.CmpItemKindSnippet = cmp_item_6
hi.cmpItemKindFolder = cmp_item_6

local cmp_item_7 = { guifg = "#ffffff", guibg = colours.blue }
hi.CmpItemKindMethod = cmp_item_7
hi.CmpItemKindValue = cmp_item_7
hi.CmpItemKindEnumMember = cmp_item_7

local cmp_item_8 = { guifg = "#ffffff", guibg = colours.cyan }
hi.CmpItemKindInterface = cmp_item_8
hi.CmpItemKindColor = cmp_item_8
hi.CmpItemKindTypeParameter = cmp_item_8

-- mason
local masonbg = floatbg
hi.MasonHeader = { guifg = "#111111", guibg = colours.orange }
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
