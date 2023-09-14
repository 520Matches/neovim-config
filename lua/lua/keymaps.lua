vim.keymap.set('n' , '<C-Up>'    , ':resize +5<CR>'          , {silent = true})
vim.keymap.set('n' , '<C-Down>'  , ':resize -5<CR>'          , {silent = true})
vim.keymap.set('n' , '<C-Left>'  , ':vertical resize +5<CR>' , {silent = true})
vim.keymap.set('n' , '<C-Right>' , ':vertical resize -5<CR>' , {silent = true})

vim.keymap.set('i' , '<C-h>' , '<Left>'  , opts)
vim.keymap.set('i' , '<C-j>' , '<Down>'  , opts)
vim.keymap.set('i' , '<C-k>' , '<Up>'    , opts)
vim.keymap.set('i' , '<C-l>' , '<Right>' , opts)

vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

vim.keymap.set('n' , 'sh' , ':vsplit<CR>'       , {silent = true})
vim.keymap.set('n' , 'sl' , ':vsplit<CR><C-w>l' , {silent = true})
vim.keymap.set('n' , 'sj' , ':split<CR><C-w>j'  , {silent = true})
vim.keymap.set('n' , 'sk' , ':split<CR>'        , {silent = true})
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

vim.keymap.set('i' , '{'  , '{}<Left>'   , opts)
vim.keymap.set('i' , '['  , '[]<Left>'   , opts)
vim.keymap.set('i' , '('  , '()<Left>'   , opts)
vim.keymap.set('i' , '"'  , '""<Left>'   , opts)
vim.keymap.set('i' , '\'' , '\'\'<Left>' , opts)

-- voldikss/vim-floaterm
-- vim.keymap.set('n', '<F9>', ':FloatermNew<CR>')
-- vim.keymap.set('n', '<F10>', ':FloatermPrev<CR>')
-- vim.keymap.set('n', '<F11>', ':FloatermNext<CR>')
-- vim.keymap.set('n', '<F12>', ':FloatermToggle<CR>')
-- voldikss/vim-floaterm

-- bagrat/vim-buffet
vim.keymap.set('n' , '<Tab>'      , ':bn<CR>')
vim.keymap.set('n' , '<S-Tab>'    , ':bp<CR>')
vim.keymap.set('n' , '<leader>bd' , ':bd<CR>')
-- bagrat/vim-buffet

-- nvim-tree/nvim-tree.lua
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors    = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', {silent = true})
-- nvim-tree/nvim-tree.lua

-- nvim-telescope/telescope
require("telescope").setup {
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
          i = {
          }
        }
      },
      pickers = {
      },
      extensions = {
      },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n' , '<leader>ff' , builtin.find_files , {})
vim.keymap.set('n' , '<leader>fg' , builtin.live_grep  , {})
vim.keymap.set('n' , '<leader>fb' , builtin.buffers    , {})
vim.keymap.set('n' , '<leader>fh' , builtin.help_tags  , {})
-- nvim-telescope/telescope

-- telescope-project.nvim
require('telescope').setup {
  -- local project_actions = require("telescope._extensions.project.actions")
  -- extensions = {
  --   project = {
  --     base_dirs = {
  --       '/dev',
  --       {'~/github'},
  --       {'/dev', max_depth = 4},
  --       {path = '/lib'},
  --       {path = '/proc', max_depth = 2},
  --     },
  --     hidden_files = true, -- default: false
  --     theme = "dropdown",
  --     order_by = "asc",
  --     search_by = "title",
  --     sync_with_nvim_tree = true, -- default false
  --     -- default for on_project_selected = find project files
  --     -- on_project_selected = function(prompt_bufnr)
  --     --   -- Do anything you want in here. For example:
  --     --   project_actions.change_working_directory(prompt_bufnr, false)
  --     --   require("harpoon.ui").nav_file(1)
  --     -- end
  --   }
  -- }
}
-- telescope-project.nvim

-- kdheepak/lazygit.nvim
vim.g.lazygit_floating_window_winblend       = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_border_chars   = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize lazygit popup window border characters
vim.g.lazygit_floating_window_use_plenary    = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote              = 1 -- fallback to 0 if neovim-remote is not installed

vim.g.lazygit_use_custom_config_file_path    = 0 -- config file path is evaluated if this value is 1
vim.g.lazygit_config_file_path               = '' -- custom config file path

vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', {silent = true})
-- kdheepak/lazygit.nvim

require("telescope").load_extension("lazygit")

-- chentoast/marks.nvim
require'marks'.setup {
    mappings = {
        set_next = "m,",
        next     = "m[",
        prev     = "m]",
    }
}

vim.keymap.set('n', '<leader>m', ':MarksListAll<CR>')
-- chentoast/marks.nvim

-- easymotion/vim-easymotion
vim.keymap.set('n', '/', '<Plug>(easymotion-sn)')
vim.keymap.set('o', '/', '<Plug>(easymotion-tn)')
vim.keymap.set('n', 'n', '<Plug>(easymotion-next)')
vim.keymap.set('n', 'N', '<Plug>(easymotion-prev)')
-- easymotion/vim-easymotion

-- godlygeek/tabular
vim.keymap.set('v', '<leader>=', ':Tabularize /=<CR>', {silent = true})
vim.keymap.set('v', '<leader>,', ':Tabularize /,<CR>', {silent = true})
vim.keymap.set('v', '<leader>;', ':Tabularize /;<CR>', {silent = true})
vim.keymap.set('v', '<leader>(', ':Tabularize /(<CR>', {silent = true})
vim.keymap.set('v', '<leader>:', ':Tabularize /:<CR>', {silent = true})
vim.keymap.set('v', '<leader><Space>', ':Tabularize /<Space><CR>', {silent = true})
-- godlygeek/tabular


-- 'nvimdev/dashboard-nvim'
local db = require('dashboard')
db.setup({
  theme = 'hyper',
  config = {
    week_header = {
     enable = true,
    },
    shortcut = {
      -- { 
      --   desc = '󰊳 Edit', 
      --   group = '@property', 
      --   action = ':e ', 
      --   key = 'e' 
      -- },
      {
        icon    = ' ',
        icon_hl = '@variable',
        desc    = 'Files',
        group   = 'Label',
        action  = 'Telescope find_files',
        key     = 'f',
      },
      {
        icon    = ' ',
        icon_hl = '@variable',
        desc    = 'String',
        group   = 'Label',
        action  = 'Telescope live_grep',
        key     = 's',
      },
      {
        desc   = ' Projects',
        group  = 'DiagnosticHint',
        action = 'Telescope projects',
        key    = 'p',
      },
      -- {
      --   desc = ' dotfiles',
      --   group = 'Number',
      --   action = 'Telescope dotfiles',
      --   key = 'd',
      -- },
    },
  },
})
-- 'nvimdev/dashboard-nvim'

-- lyokha/vim-xkbswitch
if os.name() == "MacOS" then  
  vim.g.XkbSwitchEnabled = 1
end
-- lyokha/vim-xkbswitch
