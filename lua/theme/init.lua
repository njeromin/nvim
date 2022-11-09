-- TODO: improve globals
local utils = require("theme.utils")
_G.groups = utils.groups
_G.group = utils.group
_G.darken = utils.darken
_G.lighten = utils.lighten

local theme_name = require("user.options").theme

import("theme.themes."..theme_name, function (t)
  if type(t) == "function" then
    _G.colours = t()

    -- vim
    group("Normal", { fg = colours.fg, bg = colours.bg })
    group("NormalNC", groups.Normal)
    group("Title", { fg = colours.primary, bold = true })
    group("NonText", { fg = colours.fg_dark })
    group("Error", { fg = colours.red, bg = "NONE", bold = true })
    group("ErrorMsg", { fg = colours.red, bg = "NONE" })

    group("Pmenu", { fg = colours.fg_dark, bg = darken(colours.bg_dark, 6) })
    group("PmenuSel", { fg = colours.fg, bg = colours.bg })
    group("PmenuSbar", { fg = groups.Pmenu.fg, bg = groups.Pmenu.bg })
    group("PmenuThumb", { fg = lighten(colours.bg_dark, 10), bg = lighten(colours.bg_dark, 6) })
    group("FloatBorder", { fg = groups.Pmenu.bg, bg = groups.Pmenu.bg })

    group("SignColumn", { fg = groups.Normal.fg, bg = groups.Normal.bg })
    group("LineNr", { fg = colours.grey, bg = groups.Normal.bg })
    group("CursorLine", { bg = lighten(colours.bg, 8) })
    group("CursorLineNr", { fg = colours.fg })
    group("Visual", groups.CursorLine)
    group("Search", { fg = colours.bg, bg = colours.yellow })

    -- gitsigns
    group("DiffAdd", { fg = colours.green, bg = groups.SignColumn.bg })
    group("DiffChange", { fg = colours.orange, bg = groups.SignColumn.bg })
    group("DiffDelete", { fg = colours.red, bg = groups.SignColumn.bg })

    -- lsp
    group("DiagnosticError", { fg = colours.red })
    group("DiagnosticHint", { fg = colours.cyan })
    group("DiagnosticInfo", { fg = colours.blue })
    group("DiagnosticWarn", { fg = colours.yellow })

    -- tree
    group("NeoTreeNormal", { fg = colours.fg, bg = colours.bg_dark })
    group("NeoTreeNormalNC", groups.NeoTreeNormal)
    group("NeoTreeCursorLine", { bg = lighten(groups.NeoTreeNormal.bg, 4) })
    group("NeoTreeWinSeparator", { fg = groups.NeoTreeNormal.bg, bg = groups.NeoTreeNormal.bg })
    group("NeoTreeDirectoryIcon", { fg = colours.primary })
    group("NeoTreeDirectoryName", groups.NeoTreeDirectoryIcon)
    group("NeoTreeRootName", vim.tbl_extend("keep", groups.NeoTreeDirectoryIcon, { bold = true }))

    -- bufferline
    group("BufferLineOffsetSeparator", { fg = groups.NeoTreeNormal.bg, bg = groups.NeoTreeNormal.bg })

    -- indent blankline
    group("IndentBlanklineChar", { fg = darken(colours.grey, 10) })
    group("IndentBlanklineSpaceChar", groups.IndentBlanklineChar)
    group("IndentBlanklineContextChar", { fg = lighten(colours.grey, 10) })
    group("IndentBlanklineContextStart", { fg = "NONE", bg = "NONE" })

    -- scrollbar
    group("ScrollbarHandle", { bg = lighten(colours.grey, 10) })

    -- telescope
    group("TelescopeNormal", { bg = darken(colours.bg_dark, 3) })
    group("TelescopeTitle", { fg = "#111111", bg = colours.blue })
    group("TelescopeBorder", { fg = groups.TelescopeNormal.bg, bg = groups.TelescopeNormal.bg })
    group("TelescopeSelectionCaret", { fg = colours.grey, bg = groups.Visual.bg })

    group("TelescopeResultsNormal", groups.TelescopeNormal)
    group("TelescopeResultsTitle", { fg = "#111111", bg = colours.green })

    group("TelescopePreviewNormal", { bg = darken(colours.bg_dark, 6) })
    group("TelescopePreviewTitle", { fg = "#111111", bg = colours.red })
    group("TelescopePreviewBorder", { fg = groups.TelescopePreviewNormal.bg, bg = groups.TelescopePreviewNormal.bg })

    -- ufo
    group("FoldColumn", { fg = colours.grey, bg = groups.Normal.bg })

    -- fidget
    group("FidgetTitle", { fg = colours.blue, bold = true })
    group("FidgetTask", { fg = colours.cyan })
  
    -- alpha
    group("AlphaHeader", { fg = colours.yellow })
    group("AlphaFooter", { fg = colours.blue })

    -- shared treesitter
    group("@todo", { fg = "#111111", bg = colours.orange })
  end
end)
