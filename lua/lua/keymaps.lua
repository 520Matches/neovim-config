vim.keymap.set('n', '<C-Up>', ':resize +5<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize -5<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize +5<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize -5<CR>', opts)

vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('n', 'sh', ':vsplit<CR>')
vim.keymap.set('n', 'sl', ':vsplit<CR><C-w>l')
vim.keymap.set('n', 'sj', ':split<CR><C-w>j')
vim.keymap.set('n', 'sk', ':split<CR>')
vim.keymap.set('n', '<A-h>', '<C-w>h', opts)
vim.keymap.set('n', '<A-j>', '<C-w>j', opts)
vim.keymap.set('n', '<A-k>', '<C-w>k', opts)
vim.keymap.set('n', '<A-l>', '<C-w>l', opts)
vim.keymap.set('i', '<A-h>', '<ESC><C-w>h', opts)
vim.keymap.set('i', '<A-j>', '<ESC><C-w>j', opts)
vim.keymap.set('i', '<A-k>', '<ESC><C-w>k', opts)
vim.keymap.set('i', '<A-l>', '<ESC><C-w>l', opts)
vim.keymap.set('v', '<A-h>', '<ESC><C-w>h', opts)
vim.keymap.set('v', '<A-j>', '<ESC><C-w>j', opts)
vim.keymap.set('v', '<A-k>', '<ESC><C-w>k', opts)
vim.keymap.set('v', '<A-l>', '<ESC><C-w>l', opts)

vim.keymap.set('i', '{', '{}<Left>', opts)
vim.keymap.set('i', '[', '[]<Left>', opts)
vim.keymap.set('i', '(', '()<Left>', opts)
vim.keymap.set('i', '"', '""<Left>', opts)
vim.keymap.set('i', '\'', '\'\'<Left>', opts)

-- voldikss/vim-floaterm
-- vim.keymap.set('n', '<F9>', ':FloatermNew<CR>')
-- vim.keymap.set('n', '<F10>', ':FloatermPrev<CR>')
-- vim.keymap.set('n', '<F11>', ':FloatermNext<CR>')
-- vim.keymap.set('n', '<F12>', ':FloatermToggle<CR>')
-- voldikss/vim-floaterm

-- bagrat/vim-buffet
vim.keymap.set('n', '<Tab>', ':bn<CR>')
vim.keymap.set('n', '<S-Tab>', ':bp<CR>')
vim.keymap.set('n', '<leader>bd', ':bd<CR>')
-- bagrat/vim-buffet

-- nvim-telescope/telescope
require("telescope").setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
            -- map actions.which_key to <C-h> (default: <C-/>)
            -- actions.which_key shows the mappings for your picker,
            -- e.g. git_{create, delete, ...}_branch for the git_branches picker
            -- ["<C-h>"] = "which_key"
          }
        }
      },
      pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
      },
      extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
      }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- nvim-telescope/telescope


-- chentoast/marks.nvim
require'marks'.setup {
    mappings = {
        set_next = "m,",
        next = "m[",
        prev = "m]",
    }
}

vim.keymap.set('n', '<leader>m', ':MarksListAll<CR>')
-- chentoast/marks.nvim


-- phaazon/hop.nvim
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 'F', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, {remap=true})
vim.keymap.set('', 't', function()
    hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
vim.keymap.set('', 'T', function()
    hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, {remap=true})

vim.keymap.set('n', '/', ':HopPattern<CR>')
-- phaazon/hop.nvim


-- 'junegunn/vim-easy-align'
vim.keymap.set('v', 'ea', ':EasyAlign')
-- 'junegunn/vim-easy-align'