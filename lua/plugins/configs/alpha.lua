local ok, alpha = pcall(require, "alpha")
if not ok then return end
local dashboard = require("alpha.themes.dashboard")

-- set header
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

dashboard.section.buttons.val = {
  dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("SPC f f", " Find file", ":Telescope find_files<CR>"),
  dashboard.button("SPC f r", " Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("SPC c", " Edit Config", ":e $MYVIMRC | :cd %:p:h<CR>"),
  dashboard.button(":qa", " Exit NVIM", ":qa<CR>"),
}

local installed_plugins = 0
local loaded_plugins = 0
for _, p in pairs(packer_plugins) do
  if p.loaded then loaded_plugins = loaded_plugins + 1 end
  installed_plugins = installed_plugins + 1
end

dashboard.section.footer.val = string.format("Plugins - %s (TOTAL), %s (LOADED)", installed_plugins, loaded_plugins)

alpha.setup(dashboard.config)
