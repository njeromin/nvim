local base16 = require("colors")[require("user.config").theme or "onedark"]

return {
  bg  = base16.base00,
  bg2 = base16.base01,
  bg3 = base16.base02,
  bg4 = base16.base03,

  fg  = base16.base04,
  fg2 = base16.base05,
  fg3 = base16.base06,
  fg4 = base16.base07,

  red          = base16.base08,
  orange       = base16.base09,
  yellow       = base16.base0A,
  green        = base16.base0B,
  cyan         = base16.base0C,
  blue         = base16.base0D,
  magenta      = base16.base0E,
  brown        = base16.base0F,
}
