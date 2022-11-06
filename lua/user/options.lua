local indent_width = 2

return {
  theme = "gruvbox",
  keymapping = {
    leader = " ",
  },
  vim = {
    -- indent
    shiftwidth = indent_width,
    tabstop = indent_width,
    softtabstop = indent_width,
    expandtab = true, -- true = spaces, false = tabs
    smartindent = true,
    autoindent = true,

    laststatus = 3,
    title = true,
    clipboard = "unnamedplus",
    cursorline = true,
    fillchars = { eob = " ", fold = " ", foldopen = "", foldsep = " ", foldclose = "" },
    ignorecase = true,
    smartcase = true,
    showmode = false,
    number = true,
    numberwidth = 1,
    ruler = false,
    shortmess = vim.opt.shortmess:append("sI"),
    whichwrap = vim.opt.whichwrap:append("<>[]hl"),
    signcolumn = "yes",
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    undofile = true,

    -- timeout/update
    timeoutlen = 400,
    updatetime = 250,
  }
}
