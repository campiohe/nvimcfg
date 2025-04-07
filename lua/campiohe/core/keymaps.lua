vim.g.mapleader = " "

local map = vim.keymap

-- better up/down
map.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map.set("n", "<leader>bd", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })
-- map.set("n", "<leader>bd", ":enew | bdelete #<CR>", { desc = "Delete buffer but keep window" })
-- map.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
map.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- better indenting
map.set("v", "<", "<gv")
map.set("v", ">", ">gv")

-- windows
map.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
map.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
