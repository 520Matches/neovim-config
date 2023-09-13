
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

    use 'voldikss/vim-floaterm'

    use 'bagrat/vim-buffet'

    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'

    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

    -- use 'terryma/vim-multiple-cursors'

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

    -- easy move
    -- use {
    --     'phaazon/hop.nvim',
    --     branch = 'v2', -- optional but strongly recommended
    --     config = function()
    --         require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    --     end
    -- }

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

    if system == "Darwin" then  
        use 'lyokha/vim-xkbswitch'
    elseif system == "Windows" then
        -- do something Windows related
    elseif system == "Linux" then  
        use '520Matches/fcitx5.vim'
    end

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
