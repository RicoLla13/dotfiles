local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "morhetz/gruvbox",
    "comfysage/gruvboxed",
    "xiyaowong/transparent.nvim",
	"neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'jay-babu/mason-null-ls.nvim',
    'kyazdani42/nvim-web-devicons',
    'tpope/vim-surround',
    'preservim/tagbar',
    'phpactor/phpactor',
    'universal-ctags/ctags',
    'airblade/vim-gitgutter',
    {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = function()
            require("flutter-tools").setup {}
        end,
    },
    {
        'numToStr/Comment.nvim',
		config = function()
            require('Comment').setup{}
		end,

    },
    { 'AndreM222/copilot-lualine' },
    {
        'windwp/nvim-autopairs',
		config = function()
            require('nvim-autopairs').setup{}
		end,
    },
    {
        'zbirenbaum/copilot.lua',
        cmd = "Copilot",
        -- event = "InsertEnter",
		config = function()
			require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
		end,
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function ()
            require("copilot_cmp").setup()
        end,
    },
    {
        'nvim-tree/nvim-tree.lua',
		config = function()
			require("config.nvimtree")
		end,
    },
    {
        'hoob3rt/lualine.nvim',
		config = function()
			require("config.lualine")
		end,
    },
    {
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },
	-- Auto-completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
	-- Code snippet engine
    -- Snippet engine
    { 'L3MON4D3/LuaSnip', dependencies = {
        'saadparwaiz1/cmp_luasnip', -- Snippet completion source
    }},
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
        },
		config = function()
			require("config.telescope")
		end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
        vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
})

