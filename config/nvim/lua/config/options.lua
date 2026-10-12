-- lua/config/options.lua
-- Default Neovim options
-- May be overridden in filetype-specific or plugin-specific contexts

-- Indentation
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = true

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true

-- WORKAROUND: works around treesitter markdown conceal_lines crash on nvim 0.12+
-- (neovim/neovim#39032) -- revert to previous conceallevel once fixed upstream
vim.opt.conceallevel = 0

-- Behavior
vim.opt.encoding = "UTF-8"
vim.opt.ignorecase = true

-- Remove trailing whitespace and newlines on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])  -- remove trailing whitespace
    vim.cmd([[%s/\($\n\s*\)\+\%$//e]])  -- remove trailing newlines
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Prefer the project's Makefile for :make, even where a filetype plugin
-- sets its own compiler (e.g. typst's ftplugin sets makeprg to `typst compile`)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    if vim.fn.filereadable("Makefile") == 1 then
      vim.opt_local.makeprg = "make"
    end
  end,
})
