group("LspAttached_Icon", { fg = colours.yellow, bg = groups.StatusLine.bg })
group("LspAttached_Text", { fg = colours.fg_dark, bg = groups.StatusLine.bg })

return function (win, buf)
  local client_names = nil

  local clients = vim.lsp.get_active_clients({ bufnr = buf.bufnr })

  for _, v in pairs(clients) do
    client_names = string.format("%s%s ", client_names or "", v.name)
  end

  return string.format("%s  %s%s%s", "%#LspAttached_Icon#", "%#LspAttached_Text#", client_names or "No Attached LSP ", "%#StatusLine#")
end
