return {
	laststatus = 3,
	showmode = false,
	title = true,
	clipboard = "unnamedplus",
	cursorline = true,
	expandtab = true,
  smartindent = true,
	fillchars = { eob = " ", fold = " ",  foldopen = "", foldsep = " ", foldclose = "" },
	ignorecase = true,
	smartcase = true,
	mouse = "a",
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
  foldcolumn = "1",
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,
	timeoutlen = 400,
	updatetime = 250,
}
