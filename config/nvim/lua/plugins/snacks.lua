---@type LazyPluginSpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },  -- TODO: Disable some more stuff to make it faster

    -- WORKAROUND: doc scanning crashes on markdown due to upstream treesitter bug
    -- (neovim#39032 / nvim-treesitter#8618). Revert to `enabled = true` once fixed upstream.
    image = { doc = { enabled = false } },

    input = { enabled = true },
    notifier = { enabled = true },

    -- WORKAROUND: forces an early synchronous highlight parse that crashes on markdown
    -- due to upstream treesitter bug (neovim#39032 / nvim-treesitter#8618).
    -- Revert to `enabled = true` once fixed upstream.
    quickfile = { enabled = false },

    scroll = { enabled = false },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
}
