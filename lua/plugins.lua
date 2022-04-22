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
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("config.nvim-notify")
		end,
	})
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	-- use("vim-airline/vim-airline")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("config.lualine")
		end,
	})
	-- use({
	-- 	"edluffy/specs.nvim",
	-- 	config = function()
	-- 		require("config.specs")
	-- 	end,
	-- })
	use({
		"Pocco81/TrueZen.nvim",
		config = function()
			require("config.true-zen")
		end,
	})
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

	-- use({
	-- 	"ggandor/lightspeed.nvim",
	-- 	config = function()
	-- 		require("config.lightspeed")
	-- 	end,
	-- })

	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("config.nvim-lightbulb")
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("config.nvim-autopairs")
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		config = function()
			require("config.nvim-tree")
		end,
	})
	--
	-- use({
	-- 	"ms-jpq/chadtree",
	-- 	requires = {
	-- 		"kyazdani42/nvim-web-devicons", -- optional, for file icon
	-- 	},
	-- 	run = "python3 -m chadtree deps",
	-- 	--> You will have to run :CHADdeps when installing / updating. This will install CHADTree's dependencies locally inside chadtree/.vars/runtime.
	-- 	branch = "chad",
	-- 	config = function()
	-- 		require("config.chadtree")
	-- 	end,
	-- })

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
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("config.todo-comments")
		end,
	})
	use({
		"RRethy/vim-hexokinase",
		run = "make hexokinase",
		config = function()
			require("config.vim-hexokinase")
		end,
	})
	-- use({
	-- 	"romgrk/barbar.nvim",
	-- 	requires = { "kyazdani42/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("config.barbar")
	-- 	end,
	-- })
	use({
		"kdheepak/tabline.nvim",
		commit = "bbaf9a97b24ae2d4f0c7d8751d5f28aa45332480",
		requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
		config = function()
			require("config.tabline")
		end,
	})
	use({
		"moll/vim-bbye",
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
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("config.toggleterm")
		end,
	})
	-- use({
	-- 	"luukvbaal/stabilize.nvim", --> visual bugs for nvim-tree
	-- 	config = function()
	-- 		require("config.stabilize")
	-- 	end,
	-- })

	--> DAP
	-- use({
	-- 	"rcarriga/nvim-dap-ui",
	-- 	requires = { "mfussenegger/nvim-dap" },
	-- 	config = function()
	-- 		require("config.nvim-dap-ui")
	-- 	end,
	-- })

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
			use("saadparwaiz1/cmp_luasnip"),
			use("rafamadriz/friendly-snippets"),
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
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = function()
			require("config.nvim-code-action-menu")
		end,
	})
	use({
		"jose-elias-alvarez/nvim-lsp-ts-utils",
	})

	-- ==> Color-Schemes
	use({
		"EdenEast/nightfox.nvim",
		config = function()
			require("config.nightfox")
		end,
	})
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("config.nvim-transparent")
		end,
	})

	use("matsuuu/pinkmare")
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
