local global = vim.g
local o = vim.opt

o.number = true
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
o.undofile = true
o.undoreload = 10000
o.cmdheight = 0
o.termguicolors = true

-- Run GoFmt when saving .go files
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})

local colorschemes = vim.fn.getcompletion("", "color")
local colorschemes_idx = vim.fn.index(
    colorschemes,
    vim.api.nvim_cmd({ cmd = "colorscheme" }, { output = true })
)

local function change_colorscheme(forward)
    if forward then
        colorschemes_idx = colorschemes_idx + 1
    else
        colorschemes_idx = colorschemes_idx - 1
    end

    if colorschemes_idx > #colorschemes then
        colorschemes_idx = 1
    elseif colorschemes_idx < 1 then
        colorschemes_idx = #colorschemes
    end

    local ok = pcall(function()
        vim.cmd("colorscheme " .. colorschemes[colorschemes_idx])
	vim.print(vim.inspect(colorschemes))
    end)

    if not ok then
        change_colorscheme(forward)
    end

    print(colorschemes[colorschemes_idx])
end

vim.keymap.set("n", "<C-h>", function()
    change_colorscheme(true)
end)

vim.keymap.set("n", "<C-l>", function()
    change_colorscheme(false)
end)

vim.cmd("colorscheme kanagawa-dragon")
