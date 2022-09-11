local ok, themer = pcall(require, "themer")
if not ok then return end
local opts_ok, opts = pcall(require, "user.config")
if not opts_ok then opts = { theme = "onedark" } end

themer.setup({
  colorscheme = opts.theme,
  enable_installer = true,

  plugins = {
    treesitter = true,
    indentline = true,
    barbar = false,
    bufferline = true,
    cmp = false,
    gitsigns = true,
    lsp = true,
    telescope = true,
  },
});

local function add_highlight(name)
  SafeRequire(string.format("theme.highlights.%s", name), function (to_add)
    for group, hl in pairs(to_add) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end)
end

add_highlight("nvim")
add_highlight("float")
add_highlight("mason")
add_highlight("telescope")
add_highlight("neotree")
add_highlight("cmp")
add_highlight("alpha")
add_highlight("lightbulb")
