vim.api.nvim_set_keymap("n", "-", ":NvimTreeFindFile<cr>", {silent = true, noremap = true})

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<Tab>', '10<Up>', opts('Up'))
  vim.keymap.set('n', '<C-k>', '10<Down>', opts('Down'))
end

require("nvim-tree").setup({
  view = {
    width = {
      min = 40,
      max = -1
    }
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  sync_root_with_cwd = true,
  on_attach = my_on_attach,
})
