-- HACK: nvim-treesitter is pinned to commit 42fc28b (2025-05), which still
-- assumes the pre-0.11 TSQueryMatch API where `match[capture_id]` is a single
-- TSNode. On Neovim 0.12, `match[capture_id]` is always a `TSNode[]` list, so
-- the predicate/directive handlers in nvim-treesitter/query_predicates.lua
-- do `node:range()` on a plain Lua table and crash with "attempt to call
-- method 'range' (a nil value)". This fires from `_get_injections` any time
-- a markdown fenced code block has a language annotation (because of the
-- `#set-lang-from-info-string!` directive), which aborts the whole markdown
-- parse and floods :messages with treesitter errors on nearly every .md file
-- that has code fences with language tags. See neovim/neovim#39032. DELETE
-- this block once nvim-treesitter is updated past its `general refactor`
-- rewrite (which drops these handlers' old single-node assumption) — that
-- also requires migrating this file off `nvim-treesitter.configs`.
local function patch_query_predicates_for_nvim_0_12()
  local query = require("vim.treesitter.query")

  local function node1(match, id)
    local v = match[id]
    return type(v) == "table" and v[1] or v
  end

  query.add_predicate("nth?", function(match, _, _, pred)
    local node = node1(match, pred[2])
    local n = tonumber(pred[3])
    if node and node:parent() and node:parent():named_child_count() > n then
      return node:parent():named_child(n) == node
    end
    return false
  end, { force = true })

  query.add_predicate("is?", function(match, _, bufnr, pred)
    local locals = require("nvim-treesitter.locals")
    local node = node1(match, pred[2])
    local types = { unpack(pred, 3) }
    if not node then
      return true
    end
    local _, _, kind = locals.find_definition(node, bufnr)
    return vim.tbl_contains(types, kind)
  end, { force = true })

  query.add_predicate("kind-eq?", function(match, _, _, pred)
    local node = node1(match, pred[2])
    local types = { unpack(pred, 3) }
    if not node then
      return true
    end
    return vim.tbl_contains(types, node:type())
  end, { force = true })

  local html_script_type_languages = {
    ["importmap"] = "json",
    ["module"] = "javascript",
    ["application/ecmascript"] = "javascript",
    ["text/ecmascript"] = "javascript",
  }
  query.add_directive("set-lang-from-mimetype!", function(match, _, bufnr, pred, metadata)
    local node = node1(match, pred[2])
    if not node then
      return
    end
    local value = vim.treesitter.get_node_text(node, bufnr)
    local configured = html_script_type_languages[value]
    if configured then
      metadata["injection.language"] = configured
    else
      local parts = vim.split(value, "/", {})
      metadata["injection.language"] = parts[#parts]
    end
  end, { force = true })

  local non_filetype_match_injection_language_aliases = {
    ex = "elixir",
    pl = "perl",
    sh = "bash",
    uxn = "uxntal",
    ts = "typescript",
  }
  query.add_directive("set-lang-from-info-string!", function(match, _, bufnr, pred, metadata)
    local node = node1(match, pred[2])
    if not node then
      return
    end
    local alias = vim.treesitter.get_node_text(node, bufnr):lower()
    local matched = vim.filetype.match({ filename = "a." .. alias })
    metadata["injection.language"] = matched or non_filetype_match_injection_language_aliases[alias] or alias
  end, { force = true })

  query.add_directive("downcase!", function(match, _, bufnr, pred, metadata)
    local id = pred[2]
    local node = node1(match, id)
    if not node then
      return
    end
    local text = vim.treesitter.get_node_text(node, bufnr, { metadata = metadata[id] }) or ""
    metadata[id] = metadata[id] or {}
    metadata[id].text = string.lower(text)
  end, { force = true })
end

---@type fun()
local config = function()
  require("nvim-treesitter.configs").setup({
    build = ":TSUpdate",
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    event = {
      "BufReadPre",
      "BufNewFile",
    },
    ensure_installed = {},
    ignore_install = { "org" }, -- as per `nvim-orgmode` instructions
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-s>",
        node_incremental = "<C-s>",
        scope_incremental = false,
        node_decremental = "<BS>",
      },
    },
  })

  -- HACK: must run after setup() above, since that's what pulls in
  -- nvim-treesitter.query_predicates and registers the broken handlers
  -- we're overriding. See comment on patch_query_predicates_for_nvim_0_12.
  patch_query_predicates_for_nvim_0_12()
end

---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = config,
}
