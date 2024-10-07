vim.keymap.set("n", "<leader>nt", function()
	vim.cmd.Neotree("toggle", "current")
end)
vim.keymap.set("n", "<leader>qq", function()
	vim.cmd("qa")
end)

-- block comment toggle
vim.keymap.set({ "n", "v" }, "<leader>cc", "gcc", { remap = true })

-- Install nvim plugins
vim.keymap.set({ "n", "v" }, "<leader>ls", ":Lazy sync<CR>", { remap = true })

-- fzf files in cwd
vim.keymap.set("n", "<LocalLeader>ff", ":FzfLua files<CR>", { desc = "Fzf Files" })
vim.keymap.set("n", "<LocalLeader>fg", ":FzfLua git_files<CR>", { desc = "Fzf Git files" })
vim.keymap.set("n", "<LocalLeader>fw", ":FzfLua live_grep<CR>", { desc = "Fzf grep word in files" })

-- Preview colorschemes
vim.keymap.set({ "n", "v" }, "<leader>cs", ":FzfLua colorschemes<CR>", { remap = true })
vim.keymap.set("n", "<LocalLeader>be", ":FzfLua buffers<CR>", { desc = "Show active buffers" })
