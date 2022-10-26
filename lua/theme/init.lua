local lush = require("lush")

local opts = { theme = "gruvbox" }
import("user.options", function (o) opts = o end)

local theme_name = opts.theme
local theme = require(theme_name)

print(vim.inspect(theme))

local spec = lush.extends({ theme }).with(function ()
  return {
    
  }
end)

return lush(spec)
