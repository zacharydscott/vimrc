--- Telescope Config
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--files',
      '-g',
      -- '!node_modules/**'
    },
    -- extensions = {
    --   fzy_native = {
    --     override_generic_sorter = false,
    --     override_file_sorter = true,
    --   }
    -- },
    mappings = {
      i = {
        ["<C-e>"] = actions.move_selection_previous,
      },
      n = {
        ["n"] = actions.move_selection_next,
        ["e"] = actions.move_selection_previous,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-e>"] = actions.move_selection_previous
      }
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}

local M = {}
--- Custom Functions
function M.search_vim_config()
  local conf_dir = os.getenv('XDG_CONFIG_HOME')
  require('telescope.builtin').find_files({
    prompt_title = "Nvim Config Files",
    cwd = (conf_dir and conf_dir..'/nvim') or 'C:/users/wb549004/.Config/nvim'
  })
end

function M.search_rg()
  require('telescope.builtin').find_files({
    prompt_title = 'Rip Grep',
    find_command = {
      'rg',
      '--files',
      '-g',
      '!node_modules/**',
    }
  })
end


--- Mappings
vim.api.nvim_set_keymap('n','<leader>p',':lua require(\'telescope.builtin\').find_files()<cr>', opts)
vim.api.nvim_set_keymap('n','<leader>tt',':lua require(\'telescope.builtin\').find_files()<cr>', opts)
vim.api.nvim_set_keymap('n','<leader>tb',':lua require(\'telescope.builtin\').buffers()<cr>', opts)
vim.api.nvim_set_keymap('n','<leader>tg',':lua require(\'telescope.builtin\').git_branches()<cr>', opts)
vim.api.nvim_set_keymap('n','<leader>tr',':lua require(\'telescope.builtin\').live_grep()<cr>', opts)
vim.api.nvim_set_keymap('n','<leader>tv',':lua require(\'telescopic\').search_vim_config()<cr>', opts)

return M
-- require('telescope').load_extension('fzy_native')
-- print('loading telescopic')
