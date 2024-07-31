local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local t_config  = require('telescope.config')

vim.keymap.set('', '<C-f>', builtin.find_files, {})

local open_in_nvim_tree = function(prompt_bufnr)
    local action_state = require "telescope.actions.state"
    local Path = require "plenary.path"
    local actions = require "telescope.actions"

    local entry = action_state.get_selected_entry()[1]
    local entry_path = Path:new(entry):parent():absolute()
    actions._close(prompt_bufnr, true)
    entry_path = Path:new(entry):parent():absolute() 
    entry_path = entry_path:gsub("\\", "\\\\")

    vim.cmd("NvimTreeClose")
    vim.cmd("NvimTreeOpen " .. entry_path)

    file_name = nil
    for s in string.gmatch(entry, "[^/]+") do
        file_name = s
    end

    vim.cmd("/" .. file_name)
end

local vimgrep_arguments = { unpack(t_config.values.vimgrep_arguments) }
table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.snapshot/*")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/luna_log/*")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-f>"] = open_in_nvim_tree,
        ["<C-k>"] = actions.move_selection_next,
        ["<C-i>"] = actions.move_selection_previous,
      },
      n = {
        ["<C-f>"] = open_in_nvim_tree,
        ["k"] = actions.move_selection_next,
        ["i"] = actions.move_selection_previous,
        ["q"] = actions.close,
      },
    },
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.snapshot/*", "--glob", "!**/luna_log/*", "--glob", "!**/.git/*"},
		},
  },
})
