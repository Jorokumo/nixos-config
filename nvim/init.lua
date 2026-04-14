-- --------- General Settings --------- --
vim.opt.number = true           -- line numbers
vim.opt.relativenumber = true   -- relative line numbers
vim.opt.tabstop = 2             -- 2 spaces per tab
vim.opt.shiftwidth = 2
vim.opt.expandtab = true        -- spaces instead of tabs
vim.opt.wrap = false            -- no line wrap
vim.opt.termguicolors = true    -- full colors

-- --------- Colorscheme --------- --
require("tokyonight").setup({ style = "night" })
vim.cmd("colorscheme tokyonight")

-- --------- File Tree --------- --
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- --------- Telescope --------- --
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files)  -- find files
vim.keymap.set("n", "<leader>fg", telescope.live_grep)   -- search in files

-- --------- Lualine --------- --
require("lualine").setup({ options = { theme = "tokyonight" } })

-- --------- LSP --------- --
local lspconfig = require("lspconfig")
-- add language servers here later, e.g:
-- lspconfig.pyright.setup({})   -- Python
-- lspconfig.ts_ls.setup({})    -- TypeScript

-- --------- Autocomplete --------- --
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  },
})

-- --------- Which Key --------- --
require("which-key").setup()
