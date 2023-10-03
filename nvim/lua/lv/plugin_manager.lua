-- Lazy Plugin Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Color Schemes
  "nxvu699134/vn-night.nvim",
  { "ellisonleao/gruvbox.nvim", priority = 1000 },

  -- LSP
  { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
  --- Config
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  --- Auto-completion
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  --- Snippets
  "L3MON4D3/LuaSnip",

  -- Git control
  -- "tpope/vim-fugitive",
}, opts)
