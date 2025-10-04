local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.number = true
vim.o.mouse = 'a'
vim.o.clipboard = "unnamedplus"
vim.o.ttyfast = true
vim.o.wrap = false
vim.o.termguicolors = true
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")

vim.keymap.set('n', "<leader>bg", ":%bd|e#<CR>")
vim.keymap.set('n', "<leader>n", ":enew<CR>")
vim.keymap.set('n', "<leader>bn", ":bnext<CR>")
vim.keymap.set('n', "<leader>bp", ":bprevious<CR>")
vim.keymap.set('n', "<leader>bd", ":bd<CR>")
vim.keymap.set('n', "<leader>BD", ":bd!<CR>")
vim.keymap.set('n', "<leader><tab>", ":bnext<CR>")
vim.keymap.set('n', "<leader><s-tab>", ":bprevious<CR>")
vim.keymap.set('n', "<leader>bb", ":buffer<CR>")
vim.keymap.set('n', "<leader>x", ":qa<CR>")
vim.keymap.set('n', "<leader>bl", ":ls<CR>")
vim.keymap.set('n', "<leader>bb", ":enew<CR>")
vim.keymap.set('n', "<leader>t", ":term<CR>")

require("lazy").setup({
    spec = {
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"akinsho/bufferline.nvim",
	"kyazdani42/nvim-tree.lua",
	"andweeb/presence.nvim",
	{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
	"vague2k/vague.nvim",
	"AlexvZyl/nordic.nvim",
	"dgox16/oldworld.nvim",
	"folke/tokyonight.nvim",
	"folke/trouble.nvim",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",
	"windwp/nvim-autopairs",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"OmniSharp/Omnisharp-vim",
	"xiyaowong/transparent.nvim"
  },
  install = { colorscheme = { "vague" } },
  checker = { enabled = true },
}) 

require("nvim-web-devicons").setup()
require("lualine").setup({ options = { theme = auto, globalstatus = true } })
require("bufferline").setup()
require("nvim-tree").setup({ view = { width = 30, side = "left" } })
require("presence").setup({ enable_line_number = false, main_image = "file" })
require("nvim-autopairs").setup()
require("mason").setup()
require("nordic").load()
require("oldworld").setup()
require("vague").setup()
require("tokyonight").setup()
require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "cpp", "c_sharp", "yaml", "python", "markdown" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    additional_vim_regex_highlighting = false
}
local cmp = require("cmp")
cmp.setup({
  snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
  mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = { { name = "nvim_lsp" }, { name = "buffer" }, { name = "path" } },
})

vim.keymap.set('n', "<leader>f", ":NvimTreeToggle<CR>")
vim.keymap.set('n', '<leader>g', function() require("trouble").open("diagnostics", { workspace = true }) end)

vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      }
    }
  },
  root_markers = { '.git' },
})

vim.lsp.config("clangd", {
  filetypes = { 'c', "cpp", 'h', "hpp" },
})

vim.lsp.config("omnisharp", {
    filetypes = { "cs", "vb" },
})

vim.lsp.enable("clangd")
vim.lsp.enable("omnisharp")

vim.cmd("colorscheme vague")

