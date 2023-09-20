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
vim.keymap.set({'i','v'}, '<A-h>', '<ESC><C-w>h', opts)
vim.keymap.set({'i','v'}, '<A-j>', '<ESC><C-w>j', opts)
vim.keymap.set({'i','v'}, '<A-k>', '<ESC><C-w>k', opts)
vim.keymap.set({'i','v'}, '<A-l>', '<ESC><C-w>l', opts)

vim.keymap.set('i' , '{'  , '{}<Left>'   , opts)
vim.keymap.set('i' , '['  , '[]<Left>'   , opts)
vim.keymap.set('i' , '('  , '()<Left>'   , opts)
vim.keymap.set('i' , '"'  , '""<Left>'   , opts)
vim.keymap.set('i' , '\'' , '\'\'<Left>' , opts)

-- ellisonleao/gruvbox.nvim
vim.cmd([[colorscheme gruvbox]])
-- ellisonleao/gruvbox.nvim

-- voldikss/vim-floaterm
-- vim.g.floaterm_keymap_new    = '<F9>'
-- vim.g.floaterm_keymap_prev   = '<F10>'
-- vim.g.floaterm_keymap_next   = '<F11>'
vim.g.floaterm_keymap_toggle = '<F12>'

-- vim.keymap.set('n', '<F9>', ':FloatermNew<CR>')
-- vim.keymap.set('n', '<F10>', ':FloatermPrev<CR>')
-- vim.keymap.set('n', '<F11>', ':FloatermNext<CR>')
vim.keymap.set('n', '<F12>', ':FloatermToggle<CR>')
-- voldikss/vim-floaterm

-- bagrat/vim-buffet
vim.keymap.set('n' , '<Tab>'      , ':bn<CR>')
vim.keymap.set('n' , '<S-Tab>'    , ':bp<CR>')
vim.keymap.set('n' , '<leader>bd' , ':bd<CR>')
-- bagrat/vim-buffet

-- vim-airline-themes
vim.g.airline_theme = 'random'
-- vim-airline-themes

-- nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "go", "python", "json", "xml", "bash"},
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  -- rainbow = {
  --   enable = true,
  --   -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
  --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
  --   -- colors = {}, -- table of hex strings
  --   -- termcolors = {} -- table of colour name strings
  -- },
}
-- nvim-treesitter

-- numToStr/Comment.nvim
require('Comment').setup({
  ---Add a space b/w comment and the line
  padding = true,
  ---Whether the cursor should stay at its position
  sticky = true,
  ---Lines to be ignored while (un)comment
  ignore = nil,
  ---LHS of toggle mappings in NORMAL mode
  toggler = {
      ---Line-comment toggle keymap
      line = '<leader>cc',
      ---Block-comment toggle keymap
      block = '<leader>bc',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
      ---Line-comment keymap
      line = '<leader>c',
      ---Block-comment keymap
      block = '<leader>b',
  },
  ---LHS of extra mappings
  extra = {
      ---Add comment on the line above
      above = '<leader>cO',
      ---Add comment on the line below
      below = '<leader>co',
      ---Add comment at the end of line
      eol = '<leader>cA',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
      ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
      basic = true,
      ---Extra mapping; `gco`, `gcO`, `gcA`
      extra = true,
  },
  ---Function to call before (un)comment
  pre_hook = nil,
  ---Function to call after (un)comment
  post_hook = nil,
})
-- numToStr/Comment.nvim

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
-- local project_actions = require("telescope._extensions.project.actions")
require("telescope").setup {
  -- extensions = {
  --     project = {
  --       base_dirs = {
  --         '/dev',
  --         {'~/github'},
  --         {'/dev', max_depth = 4},
  --         {path = '/lib'},
  --         {path = '/proc', max_depth = 2},
  --       },
  --       hidden_files = true, -- default: false
  --       theme = "dropdown",
  --       order_by = "asc",
  --       search_by = "title",
  --       sync_with_nvim_tree = true, -- default false
  --       -- default for on_project_selected = find project files
  --       on_project_selected = function(prompt_bufnr)
  --         -- Do anything you want in here. For example:
  --         project_actions.change_working_directory(prompt_bufnr, false)
  --         require("harpoon.ui").nav_file(1)
  --       end
  --     }
  -- },
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

-- neovim-session-manager
-- require('session_manager').setup()
-- require('session_manager.config').setup()
-- neovim-session-manager

-- coffebar/neovim-project
-- require("neovim-project").setup({
--   projects = { -- define project roots
--       "~/.config/nvim/*",
--       "~/github/*",
--       "~/downloads/*",
--   },
--   datapath = vim.fn.stdpath("data"), -- ~/.local/share/nvim/

--   -- Overwrite some of Session Manager options
--   session_manager_opts = {
--     autosave_ignore_dirs = {
--       vim.fn.expand("~"), -- don't create a session for $HOME/
--       "/tmp",
--     },
--     autosave_ignore_filetypes = {
--       -- All buffers of these file types will be closed before the session is saved
--       "gitcommit",
--       "gitrebase",
--     },
--   },
-- })
-- coffebar/neovim-project


-- telescope-project.nvim
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
require('marks').setup {
    mappings = {
        set_next = "m,",
        next     = "mn",
        prev     = "mp",
    }
}

vim.keymap.set('n', '<leader>ma', ':MarksListAll<CR>', {silent = true})
vim.keymap.set('n', '<leader>rm', ':delmarks ')
vim.keymap.set('n', '<leader>dm', ':delmarks!<CR>', {silent = true})
-- chentoast/marks.nvim

-- easymotion/vim-easymotion
vim.keymap.set('n', '/', '<Plug>(easymotion-sn)', {silent = true})
vim.keymap.set('o', '/', '<Plug>(easymotion-tn)', {silent = true})
vim.keymap.set('n', 'n', '<Plug>(easymotion-next)', {silent = true})
vim.keymap.set('n', 'N', '<Plug>(easymotion-prev)', {silent = true})
-- easymotion/vim-easymotion

-- godlygeek/tabular
vim.keymap.set('v', '<leader>=', ':Tabularize /=<CR>', {silent = true})
vim.keymap.set('v', '<leader>,', ':Tabularize /,<CR>', {silent = true})
vim.keymap.set('v', '<leader>;', ':Tabularize /;<CR>', {silent = true})
vim.keymap.set('v', '<leader>(', ':Tabularize /(<CR>', {silent = true})
vim.keymap.set('v', '<leader>:', ':Tabularize /:<CR>', {silent = true})
vim.keymap.set('v', '<leader><Space>', ':Tabularize /<Space><CR>', {silent = true})
-- godlygeek/tabular

-- mg979/vim-visual-multi
-- mg979/vim-visual-multi

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
        icon   = ' ',
        icon_hl = '@variable',
        desc   = 'Projects',
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


-- neovim/nvim-lspconfig
local lspconfig = require('lspconfig')
-- python
-- lspconfig.pyright.setup {}

-- c
-- lspconfig.clangd.setup{}

-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'H', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<leader>rn', vim.lsp.buf.rename, opts)
    -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    -- vim.keymap.set('n', '<space>f', function()
    --   vim.lsp.buf.format { async = true }
    -- end, opts)
  end,
})
-- neovim/nvim-lspconfig

-- mason.nvim
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "clangd", "bashls", "gopls", "jsonls", "pyright" },
}
-- mason.nvim

-- lspkind-nvim
local lspkind = require('lspkind')
lspkind.init({
  -- DEPRECATED (use mode instead): enables text annotations
  --
  -- default: true
  -- with_text = true,

  -- defines how annotations are shown
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "",
  },
})

-- lspkind-nvim

-- hrsh7th/nvim-cmp
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
    { name = 'path' },
    { name = 'cmdline' },
  }),
  formatting = {
    format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      before = function (entry, vim_item)
        -- Source 显示提示来源
        vim_item.menu = "["..string.upper(entry.source.name).."]"
        return vim_item
      end
    })
  },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
-- hrsh7th/nvim-cmp