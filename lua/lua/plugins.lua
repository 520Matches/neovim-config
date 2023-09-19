
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
    return true
    end
    return false
end
  
local packer_bootstrap = ensure_packer()
  
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use "ellisonleao/gruvbox.nvim"

    use 'voldikss/vim-floaterm'

    use 'bagrat/vim-buffet'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    use 'numToStr/Comment.nvim'

    use 'nvim-tree/nvim-tree.lua'
    
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = 
        {
            {'nvim-lua/plenary.nvim'} ,
            {'nvim-telescope/telescope-file-browser.nvim'},
            {'nvim-telescope/telescope-project.nvim'},
            {'kdheepak/lazygit.nvim'},
        }
    }

    use 'chentoast/marks.nvim'

    use 'easymotion/vim-easymotion'

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        -- config = function()
        --     require('dashboard').setup {
              
        --     }
        -- end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    use 'godlygeek/tabular'

    -- use 'mg979/vim-visual-multi'

    if os.name() == "MacOS" then  
        use 'lyokha/vim-xkbswitch'
    elseif os.name() == "Windows" then
        -- do something Windows related
    elseif os.name() == "Linux" then  
        use '520Matches/fcitx5.vim'
    end

    use 'neovim/nvim-lspconfig'
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    use 'onsails/lspkind-nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
