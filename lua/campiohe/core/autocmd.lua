local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command

local CampioheGroup = augroup("campiohe", {})

autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

usercmd("Crpath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

autocmd("LspAttach", {
	group = CampioheGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "<leader>cf", function()
			vim.lsp.buf.format()
		end, opts)
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		-- Improve this keymaps
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
	end,
})
