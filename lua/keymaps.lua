local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --->>> LSP: lua/lsp.lua
--> Formatting
keymap("n", "<leader>f", ":Format<CR>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
--
-- keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = false })
-- keymap("n", "<leader>s", ":w <CR>", { noremap = true, silent = false })
keymap("n", "<leader>s", ":w<CR>", { noremap = true, silent = false })
keymap("n", "<leader>w", ":w <bar> Bdelete <CR>", opts)
--> barbar
-- keymap("n", "<leader>w", ":w <bar> BufferClose! <CR>", opts)

-- Telescope --
--
-- keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
keymap("n", "<leader>t", "<cmd>lua require'telescope.builtin'.find_files()<CR>", opts)
keymap("n", "<leader>g", "<cmd>lua require'telescope.builtin'.live_grep()<CR>", opts)
keymap("n", "<leader>o", "<cmd>lua require'telescope.builtin'.oldfiles()<CR>", opts)
keymap("n", "<leader>N", "<cmd>Telescope notify<CR>", opts)
--

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- NvimTree
--=== c/p ==> copy/paste
--=== a ==> new file
--=== r ==> rename
--=== d ==> delete
--=== y ==> copy name to system clipboard
--=== Y ==> copy relative path to system clipboard
--=== gy ==> copy absolute path to system clipboard
--=== W ==> collapse the whole tree
--=== C-] ==> cd ./<dir>
--=== <click on abs path> ==> cd ..
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
--
--> barbar-nvim-tree / barbar + NvimTree
-- keymap("n", "<leader>e", ":lua require 'config.barbar-nvim-tree'.toggle_tree()<CR>", opts)

-- Hide search highlight
keymap("n", "<leader>,", ":nohlsearch<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

--<==> Navigate buffers
--
--*** Don't respect the order
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
--
--*** Respect the order
--> BarBar
-- keymap("n", "<S-l>", ":BufferNext<CR>", opts)
-- keymap("n", "<S-h>", ":BufferPrevious<CR>", opts)
--> Tabline
keymap("n", "<S-l>", ":TablineBufferNext<CR>", opts)
keymap("n", "<S-h>", ":TablineBufferPrevious<CR>", opts)
--

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
local format = string.format
for i = 1, 9, 1 do
	keymap("n", format("<leader>%d", i), format("<cmd>%dToggleTerm<CR>", i), term_opts)
end

-- keymap("", "<M-0>", "<cmd>0ToggleTerm<CR>", term_opts)
-- -- keymap("", "<leader>0", "<cmd>0ToggleTerm<CR>", term_opts)
-- keymap("", "<M>1", "<cmd>1ToggleTerm<CR>", term_opts)
-- keymap("", "<leader>2", "<cmd>2ToggleTerm<CR>", term_opts)
-- keymap("", "<leader>3", "<cmd>3ToggleTerm<CR>", term_opts)
-- keymap("", "<leader>4", "<cmd>4ToggleTerm<CR>", term_opts)
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
