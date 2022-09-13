local ok, alpha = pcall(require, "alpha")
if not ok then return end
local dashboard = require("alpha.themes.dashboard")

-- header
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.header.val = {
  "                                                     ",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
  "                                                     ",
}

-- buttons
dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("SPC f f", "  Find file", ":Telescope find_files<CR>"),
  dashboard.button("SPC f r", "  Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC c", "  Edit Config", ":e $MYVIMRC | :cd %:p:h<CR>"),
  dashboard.button(":qa", "  Exit NVIM", ":qa<CR>"),
}

-- footer
dashboard.section.footer.opts.hl = "AlphaFooter"
local function footer()
  local vim_version = vim.version()
  local version = string.format(" %s.%s.%s", vim_version.major, vim_version.minor, vim_version.patch)

  local time = os.date("  %d/%m/%Y")

  return string.format("%s   %s", time, version)
end
dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
