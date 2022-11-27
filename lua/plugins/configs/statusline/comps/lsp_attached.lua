group("LspAttached_Icon", { fg = colours.yellow, bg = groups.StatusLine.bg })
group("LspAttached_Text", { fg = colours.fg_dark, bg = groups.StatusLine.bg })

return function (win, buf)
  local client_names = {}

  local clients = vim.lsp.get_active_clients({ bufnr = buf.bufnr })

  for _, v in pairs(clients) do
    table.insert(client_names, v.name)
  end

  local attached = table.concat(client_names, ", ")
  if attached == "" then attached = "No LSP" end
  return string.format("%s   %s%s%s ", "%#LspAttached_Icon#", "%#LspAttached_Text#", attached, "%#StatusLine#")
end
