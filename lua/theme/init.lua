local utils = require("theme.utils")
local groups = utils.groups
local group = utils.group
local darken = utils.darken
local lighten = utils.lighten

local theme_name = require("user.options").theme

import("theme.themes."..theme_name, function (t)
  if type(t) == "function" then
    local colours = t(group, groups)

    -- vim
    group("Normal", { fg = colours.fg, bg = colours.bg })
    group("NormalNC", groups.Normal)
    group("Title", { fg = colours.primary, bold = true })
    group("NonText", { fg = colours.fg_dark })

    group("Pmenu", { fg = colours.fg_dark, bg = darken(colours.bg_dark, 10) })
    group("PmenuSel", { fg = colours.fg, bg = colours.bg })
    group("PmenuSbar", { fg = groups.Pmenu.fg, bg = groups.Pmenu.bg })
    group("PmenuThumb", { fg = lighten(colours.bg_dark, 10), bg = lighten(colours.bg_dark, 10) })

    group("SignColumn", { fg = groups.Normal.fg, bg = groups.Normal.bg })
    group("LineNr", { fg = colours.grey, bg = groups.Normal.bg })
    group("CursorLine", { bg = lighten(colours.bg, 10) })
    group("CursorLineNr", { fg = colours.fg })
    group("StatusLine", { fg = colours.fg, bg = lighten(colours.bg_dark, 10)})

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
    group("NeoTreeWinSeparator", { fg = groups.NeoTreeNormal.bg, bg = groups.NeoTreeNormal.bg })
    group("NeoTreeDirectoryIcon", { fg = colours.primary })
    group("NeoTreeDirectoryName", groups.NeoTreeDirectoryIcon)
    group("NeoTreeRootName", vim.tbl_extend("keep", groups.NeoTreeDirectoryIcon, { bold = true }))

    -- bufferline
    group("BufferLineOffsetSeparator", groups.NeoTreeNormal)

    -- indent blankline
    group("IndentBlanklineChar", { fg = darken(colours.grey, 10) })
    group("IndentBlanklineSpaceChar", groups.IndentBlanklineChar)
    group("IndentBlanklineContextChar", { fg = lighten(colours.grey, 10) })
    group("IndentBlanklineContextStart", { fg = "NONE", bg = "NONE" })

    -- scrollbar
    group("ScrollbarHandle", { bg = lighten(colours.grey, 10) })
  end
end)
