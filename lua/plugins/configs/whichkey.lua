local ok, wk = pcall(require, "which-key")
if not ok then return end

local function all_register(mappings)
  for _, mode in pairs({ "n", "i", "v", "x", "s", "o", "c", "t" }) do
    wk.register(mappings, { mode = mode })
  end
end

all_register({
  ["<A-f>"] = { "<cmd>ToggleTerm direction=float<cr>", "  Toggle Floating Terminal" },
  ["<C-s>"] = { "<cmd>w<cr>", "Save" },
  ["<C-x>"] = { "<cmd>qa<cr>", "Exit" },
})

wk.register({
  ["<Tab>"] = { "<cmd>BufferLineCycleNext<cr>", "Cycle Bufferline" },
})

wk.register({
  f = {
    name = "  Find",

    f = { "<cmd>Telescope find_files<cr>", "  Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "  Grep" },
    n = { "<cmd>Telescope notify<cr>", "  Notifications" },
  },

  p = {
    name = "  Packer",

    s = { function() require("packer").sync() end, "Sync" },
    i = { function() require("packer").status() end, "Status" },
  },

  m = { "<cmd>Mason<cr>", "  Open Mason" },
  t = { "<cmd>TroubleToggle<cr>", "飯 Toggle Traffic "},
  e = { "<cmd>Neotree reveal<cr>",  "פּ  Focus Tree"  },
}, { prefix = "<leader>" })
