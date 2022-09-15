local ok, wk = pcall(require, "which-key")
if not ok then return end

local function all_register(mappings)
  for _, mode in pairs({ "n", "i", "v", "x", "s", "o", "c", "t" }) do
    wk.register(mappings, { mode = mode })
  end
end

all_register({
  ["<A-f>"] = { "<cmd>ToggleTerm direction=float<cr>", "  Toggle floating terminal" },
  ["<A-j>"] = { function () vim.lsp.buf.code_action() end, "Show code actions" },
})

wk.register({
  ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle Bufferline" },
  ["."] = { "<cmd>set number! relativenumber!<cr>", "Toggle Relative Number" },
}, { mode = "n" })

wk.register({
  f = {
    name = "  Find",

    f = { "<cmd>Telescope find_files<cr>", "  Find file" },
    r = { "<cmd>Telescope oldfiles<cr>", " Recent files" },
    g = { "<cmd>Telescope live_grep<cr>", "  Grep" },
    n = { "<cmd>Telescope notify<cr>", "  Notifications" },
  },

  p = {
    name = "  Packer",

    s = { function() require("packer").sync() end, "Sync" },
    i = { function() require("packer").status() end, "Status" },
  },

  i = { "<cmd>IconPickerNormal<cr>", "  Pick icon" },
  m = { "<cmd>Mason<cr>", "  Open mason" },
  t = { "<cmd>TroubleToggle<cr>", " Toggle trouble"},
  e = { "<cmd>Neotree reveal<cr>",  "פּ  Focus tree"  },
  c = { ":e $MYVIMRC | :cd %:p:h<CR>", " Edit config" },
}, { prefix = "<leader>" })
