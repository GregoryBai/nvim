vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_header = require "config.dashboard.eyes"
vim.g.dashboard_preview_file_width = 18 / 2
vim.g.dashboard_preview_file_height = 36 / 2
vim.g.dashboard_custom_section = {
  a = {description = {'  Find File          '}, command = 'Telescope find_files'},
  d = {description = {'  Search Text        '}, command = 'Telescope live_grep'},
  b = {description = {'  Recent Files       '}, command = 'Telescope oldfiles'},
  e = {description = {'  Config             '}, command = 'edit ~/.config/nvim/init.lua'}
}

vim.g.dashboard_custom_footer = {'Do one thing, do it well - Unix Philosophy'}
