-- TODO: make the default true to not require so many unneccesary entries
return {
  ["impatient"] = true,
  ["mappings"] = true,
  ["lsp"] = true,
  ["dap"] = false,
  ["completion"] = true,
  ["snippets"] = true,
  ["formatting"] = true,
  ["autocommands"] = true,
  ["terminal"] = true,
  ["disable_providers"] = true,
  ["disable_builtins"] = true,
  ["interface"] = true,
  ["theme"] = true,
  ["statusline"] = true,
  ["neovide"] = vim.g.neovide or false,
}
