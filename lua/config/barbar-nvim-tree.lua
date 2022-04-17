local _M = {}
local ntree = require("nvim-tree")
local view = require("nvim-tree.view")
-- local events = require("nvim-tree.events")
-- events.on_nvi_tree_ready:
local ok, b_state = pcall(require, "bufferline.state")

if not ok then
	return
end

_M.toggle_tree = function()
	-- vim.notify(vim.bo.filetype)
	if view.is_visible() then
		-- ntree.focus()
		ntree.toggle()
		b_state.set_offset(0)
	else
		-- require'bufferline.state'.set_offset(-31, '')
		b_state.set_offset(31, "")
		ntree.toggle()
		require("nvim-tree").find_file(true)
	end
end

return _M
