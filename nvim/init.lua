local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { "akinsho/bufferline.nvim" },
  "xiyaowong/nvim-transparent",
  "nvim-treesitter/nvim-treesitter",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "L3MON4D3/LuaSnip",
  "windwp/nvim-autopairs",
  "kyazdani42/nvim-web-devicons",
  "rebelot/kanagawa.nvim",
--  "helbing/aura.nvim",
  "rafamadriz/friendly-snippets",
  "andweeb/presence.nvim",
  "AlexvZyl/nordic.nvim",
--  "savq/melange",
  "akinsho/nvim-bufferline.lua",
--  "rose-pine/neovim",
--  "Shatur/neovim-ayu",
  "Mofiqul/vscode.nvim",
  { "wtfox/jellybeans.nvim", opts = {}},
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "folke/trouble.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  "projekt0n/github-nvim-theme",
  "bluz71/vim-moonfly-colors",
  "dgox16/oldworld.nvim",
  "zootedb0t/citruszest.nvim",
  "m4xshen/hardtime.nvim",
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
  }
  },
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("nvim-web-devicons").setup({})
      require("nvim-tree").setup({ view = { width = 30, side = "left" } })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  }
})

require("nvim-treesitter.configs").setup({
  ensure_installed = {},
  highlight = { enable = true },
})

require("lspconfig").pyright.setup({})

require("lualine").setup({ options = { theme = "auto", globalstatus = true } })

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

require("nvim-autopairs").setup({})
--[[
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
--]]
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- Switch between buffers
vim.keymap.set('n', '<leader>bn', ':bnext<CR>')      -- Go to next buffer
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>')  -- Go to previous buffer

-- Close the current buffer
vim.keymap.set('n', '<leader>bd', ':bd<CR>')         -- Close the current buffer

-- Close all other buffers except the current one

vim.keymap.set('n', '<leader>bg', ':%bd|e#<CR>')     -- Keep only the current buffervim.keymap.set('n', '<leader>n', ':enew')            -- Open new empty buffer

vim.keymap.set("n", "<F3>", "<cmd>set spell!<CR>", { desc = "Toggle spell check" })

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.expandtab = true -- Use spaces instead of tabs
vim.o.shiftwidth = 4    -- Number ofvim.cmd.colorscheme "catppuccin" spaces for each indentation level
vim.o.tabstop = 4       -- Number of spaces a tab counts for
vim.o.softtabstop = 4 -- See multiple spaces as tabstops


vim.g.mapleader = ' '  -- Set leader key to space
vim.o.compatible = false -- Disable compatibility to old-time vi
vim.o.showmatch = true -- Show matching brackets
vim.o.ignorecase = true -- Case insensitive search
vim.o.mouse = 'v' -- Middle-click paste
vim.o.hlsearch = true -- Highlight search results
vim.o.incsearch = true -- Incremental search
vim.o.number = true -- Add line numbers
-- vim.o.wildmode = 'longest:list' -- Get bash-like tab completions
vim.cmd('filetype plugin indent on') -- Allow auto-indenting depending on file type
vim.cmd('syntax on') -- Enable syntax highlighting
vim.o.mouse = 'a' -- Enable mouse click
vim.o.clipboard = 'unnamedplus' -- Use the system clipboard
vim.o.ttyfast = true -- Enable fast scrolling
vim.o.spell = false -- Spell check
vim.opt.wrap = false

vim.keymap.set('n', '<leader>t', ':TransparentToggle<CR>', { desc = 'Toggle Transparency' }, { silent = true })
-- vim.keymap.set('n', '<leader>t', ':colorscheme kanagawa-dragon<CR>')
-- require('nordic').load()



-- The setup config table shows all available config options with their default values:
require("presence").setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "file",                   -- Main image display (either "neovim" or "file")
    client_id           = "793271441293967371",       -- Use your own Discord application client id (not recommended)
    log_level           = warn,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = true,                      -- Displays the current line number instead of the current project
    blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
    buttons             = true,                       -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
    file_assets         = {},                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "Editing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})


local lspconfig = require('lspconfig')

vim.opt.termguicolors = true

-- Bufferline setup
require("bufferline").setup {
  options = {
    numbers = "ordinal",
    diagnostics = "nvim_lsp",
  }
}

require("lspconfig").clangd.setup({
  cmd = { "clangd", "--header-insertion=never" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require("lspconfig").util.root_pattern("compile_commands.json", ".git"),
})


-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", space = "·" }



require("transparent").setup({
  enable = false, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

     "NormalFloat" -- plugins which have float panel such as Lazy, Mason, LspInfo


    -- "BufferLineTabClose",
    -- "BufferlineBufferSelected",
    -- "BufferLineSeparator",
    -- "BufferLineIndicatorSelected",
  },
  exclude = {
    "LineNr",
    "Normal"
  }, -- table: groups you don't want to clear
})

require('transparent').clear_prefix('BufferLine')
require('transparent').clear_prefix('Trouble')
require('transparent').clear_prefix('nvim-tree')

vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>bl", ":ls<CR>", { silent = true })
vim.keymap.set("n", "<leader>bb", ":buffer ", { silent = false })
vim.keymap.set("n", "<leader>BD", ":bd!<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", ":qa<CR>", { silent = false })
vim.keymap.set("n", "<leader>n", ":enew<CR>", { silent = true })

-- Move to the next buffer with Tab
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':bnext<CR>', { noremap = true, silent = true })

-- Move to the previous buffer with Shift+Tab
vim.api.nvim_set_keymap('n', '<leader><S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

local themes = {
  "rose-pine", -- 1
  "ayu-mirage", -- 2
  "ayu", -- 3
  "vscode", -- 4
  "melange", -- 5
  "jellybeans", -- 6
  "kanagawa", -- 7
  "aura", -- 8
  "default", -- 9
  "nordic", -- 10
  "github_dark_default", -- 11
  "oldworld", -- 12
  "citruszest", -- 13
  "tokyonight-night", -- 14
  "moonfly" -- 15
}

vim.cmd("colorscheme " .. themes[15])
-- require("jellybeans").setup({ opts = {} })
-- require("kanagawa").setup({ theme = "dragon" })
-- require("vscode").setup()
-- require("vscode").load()

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {}, -- You can add more here
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

require("mason-lspconfig").setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({})
  end,

  -- Optional custom config per server:

})


require'lspconfig'.omnisharp.setup{
  cmd = { "OmniSharp" },
  filetypes = { "cs", "vb" },
  root_dir = require'lspconfig'.util.root_pattern("*.csproj", "*.sln"),
}


require("trouble").setup()



vim.keymap.set('n', '<leader>g', function()
  require("trouble").open("diagnostics", { workspace = true })
end, { desc = 'Open Trouble with workspace diagnostics' })

vim.keymap.set('n', '<leader>y', ':term<CR>')

require('telescope').setup()
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono NF:h10"
    vim.g.neovide_opacity = 0.9
    vim.g.neovide_normal_opacity = 0.9
    vim.g.neovide_cursor_smooth_blink = true
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_floating_blur_amount_x = 0.0
    vim.g.neovide_floating_blur_amount_y = 0.0
    vim.g.neovide_floating_shadow = false
    vim.api.nvim_del_keymap("n", "<leader>t")
end

-- require("hardtime").setup()

