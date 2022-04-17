local lsp_installer = require("nvim-lsp-installer")

local function on_attach(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local opts = { noremap = true, silent = true }

	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "<C-i>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

local servers = {
	"cssls",
	"eslint",
	"html",
	"jsonls",
	"rust_analyzer",
	"solc",
	"sumneko_lua",
	"svelte",
	"tsserver",
	"vimls",
}

for _, lsp in pairs(servers) do
	local server_is_found, server = lsp_installer.get_server(lsp)

	if server_is_found then
		if not server:is_installed() then
			print("Installing " .. lsp)
			server:install()
		end
	end
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
	}

	if server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = { globals = { "vim", "PACKER_BOOTSTRAP" } },
			},
		}
	end

	server:setup(opts)
end)
