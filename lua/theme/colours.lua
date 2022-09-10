local colours = require("themer.modules.core.api").get_cp(require("user.config").theme or "onedark") or {}

colours.fg2 = require("utils.colours").darken(colours.fg, 10)

return colours
