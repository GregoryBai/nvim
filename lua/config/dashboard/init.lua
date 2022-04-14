vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = require("config.dashboard.neovim")
vim.g.dashboard_preview_file_width = 18 / 2
vim.g.dashboard_preview_file_height = 36 / 2
vim.g.dashboard_custom_section = {
	a = { description = { "" }, command = "" },
	-- a = { description = { "  Find File          " }, command = "Telescope find_files" },
	-- d = { description = { "  Search Text        " }, command = "Telescope live_grep" },
	-- b = { description = { "  Recent Files       " }, command = "Telescope oldfiles" },
	-- e = { description = { "  Config             " }, command = "edit ~/.config/nvim/init.lua" },
}

vim.g.dashboard_custom_footer = { "'Just get me a damn FAANG job! Am I asking for too much?!' - me" }

vim.cmd(":hi DashboardHeader guifg=#0abdc6")
-- vim.cmd(":hi DashboardHeader guifg=#0abdc6 guibg=#711c91 ctermfg=19 ctermbg=230")
-- vim.cmd(":hi DashboardFooter guifg=#091833 guibg=#133e7c ctermfg=19 ctermbg=230")
