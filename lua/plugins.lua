local fn = vim.fn

-->>> https://github.com/wbthomason/packer.nvim
-->>
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("packer not loaded!")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("vim-airline/vim-airline")
	use("tpope/vim-surround")
	use({
		-- "tpope/vim-commentary",
		"numToStr/Comment.nvim", -->  gcc & gc
		requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("config.comment")
		end,
	})
	-- use "ap/vim-css-color" -- CSS Color Preview
	use("terryma/vim-multiple-cursors")
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.nvim-autopairs")
		end,
	})
	--use "rstacruz/vim-closer"
	-- use { 'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview' } --? NOT_WORKING
	-- use "glepnir/dashboard-nvim"
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("config.nvim-tree")
		end,
	})

	--> Telescope <--
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) --> telescope requirement for faster search
	use({
		"nvim-telescope/telescope.nvim", --> must have ripgrep installed on the system
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("config.telescope")
		end,
	})

	use("nvim-telescope/telescope-media-files.nvim")
	-- use 'nvim-telescope/telescope-project.nvim'

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("config.treesitter")
		end,
	})
	use("p00f/nvim-ts-rainbow")
	use({
		"RRethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			require("config.vim-hexokinase")
		end,
	})
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("config.barbar")
		end,
	})
	use("lukelbd/vim-toggle")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("config.gitsigns")
		end,
	})
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("config.dashboard")
		end,
	})
	-- use {
	--   'noib3/nvim-cokeline',
	--   requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
	--   config = function() require('cokeline').setup() end
	-- }
	-- use {'akinsho/config.bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}

	-- ==> LSP
	use("neovim/nvim-lspconfig")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config.trouble")
		end,
	})
	use({
		"williamboman/nvim-lsp-installer",
		config = function()
			require("config.lsp")
		end,
	})
	--
	-- ==> Auto-Completion
	-- use "hrsh7th/nvim-compe" <== deprecated
	use({
		"hrsh7th/nvim-cmp",
		commit = "f573479528cac39ff5917a4679529e4435b71ffe",
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			use("L3MON4D3/LuaSnip"), --> Snippet Engine
			-- use "saadparwaiz1/cmp_luasnip",
			-- use "rafamadriz/friendly-snippets",
		},
		config = function()
			require("config.cmp")
		end,
	})

	-- ==> Formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("config.null-ls")
		end,
	})

	-- ==> Color-Schemes
	use("xiyaowong/nvim-transparent")

	use("liuchengxu/space-vim-dark")
	use("fcpg/vim-farout")
	use("sainnhe/gruvbox-material")
	use("folke/tokyonight.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
