local ok, Popup = pcall(require, "nui.popup")
if not ok then return end
local event = require("nui.utils.autocmd").event
local NuiText = require("nui.text")

local M = {}

local popup = Popup({
  position = "50%",
  size = {
    width = "80%",
    height = "70%",
  },
  enter = true,
  focusable = true,
  relative = "editor",
  border = {
    style = "single",
  },
  buf_options = {
    modifiable = true,
    readonly = false,
  },
  win_options = {
    winhighlight = "Normal:Float,FloatBorder:FloatBorder",
  },
})

M.mounted = false

M.mount = function ()
  popup:mount()
  M.mounted = true

  popup:on(event.BufLeave, function ()
    popup:unmount()
    M.mounted = false
  end)

  local title = NuiText(" Settings ", "FloatTitle")
  title:render(popup.bufnr, popup.ns_id, 1, 0, 1, 0)
end

M.unmount = function ()
  popup:unmount()
  M.mounted = false
end

M.toggle = function ()
  if M.mounted then
    M.unmount()
  else
    M.mount()
  end
end

return M
