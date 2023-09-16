-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local utils = require("astronvim.utils")
local get_icon =  utils.get_icon
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>i"] = {":OrganizeImports<cr>", desc = "Organize Imports (TS)"},
    ["<leader>h"] = { desc = get_icon("ArrowRight", 1, true) .. "Harpoon" },
    ["<leader>hm"] = {"<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon"},
    ["<leader>hl"] = {"<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark"},
    ["<leader>hh"] = {"<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark"},
    ["<leader>he"] = {"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "See all harpoon marks"},
    ["<leader>ht"] = {"<cmd>Telescope harpoon marks<cr>", desc = "Navigate using telescope"}

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v  = {
    ["J"] = {":m '>+1<CR>gv=gv", desc = "Move line down"},
    ["K"] = {":m '<-2<CR>gv=gv", desc = "Move line up"},
  }
}
