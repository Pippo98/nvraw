vim.opt.number = true
vim.opt.winborder = "rounded"
vim.opt.swapfile = false
vim.opt.wrap = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.cursorline = false
vim.opt.signcolumn = "yes"
vim.opt.path = "**"
vim.opt.mouse = ""
vim.g.mapleader = " "
-- smartcase 
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- default: :setlocal spell spelllang=en_us
vim.opt.spell = true
vim.opt.spelllang = "en"

-- lsp
vim.opt.completeopt = { "menuone", "noselect", "popup" } 
vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "go to declaration" })

vim.keymap.set({"n", "v"}, "j", "gj")
vim.keymap.set({"n", "v"}, "k", "gk")
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("n", "<leader>td", ":edit ~/.global-todo-list.md<CR>")

vim.keymap.set("n", "<leader>o", ":write<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

vim.keymap.set("n", "zs", "zt<C-y>")

--- Buffers
vim.keymap.set("n", "<leader>d", ":bp|bd#<CR>")

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/echasnovski/mini.pick" },
  { src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	-- bufferline
  { src = "https://github.com/akinsho/bufferline.nvim" },
	{ src = "https://github.com/tiagovla/scope.nvim" },
	-- neo-tree
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },
  -- dependencies
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/MunifTanjim/nui.nvim" },
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },
	-- copilot
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	-- themes
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/kdheepak/monochrome.nvim" },
	{ src = "https://github.com/olimorris/onedarkpro.nvim" },
	{ src = "https://github.com/Mofiqul/vscode.nvim" },
	{ src = "https://github.com/EdenEast/nightfox.nvim" },
	{ src = "https://github.com/sainnhe/gruvbox-material" },
	{ src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
	{ src = "https://github.com/zootedb0t/citruszest.nvim" },
	{ src = "https://github.com/Mofiqul/adwaita.nvim" },
	{ src = "https://github.com/sainnhe/everforest" },
	{ src = "https://github.com/marko-cerovac/material.nvim" },
	{ src = "https://github.com/olimorris/onedarkpro.nvim" },
	{ src = "https://github.com/Mofiqul/dracula.nvim" },
	{ src = "https://github.com/shaunsingh/nord.nvim" },
	{ src = "https://github.com/blazkowolf/gruber-darker.nvim" },
})

vim.keymap.set("n", "<leader>pf", ":Pick files<CR>")
vim.keymap.set("n", "<leader>ph", ":Pick help<CR>")
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR> ")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

require "neo-tree".setup({})
require "vague".setup({ transparent = true })
require "gruvbox".setup()
require "bufferline".setup()
require "scope".setup({})
require "mini.pick".setup()
require "mason".setup()
require "blink.cmp".setup({
	completion = {
		menu = {
			auto_show = true
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = true
			}
		}
	},
	keymap = {
		['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-e>'] = { 'hide' },
		['<CR>'] = { 'accept', 'fallback' },

		['<Tab>'] = { 'select_next', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'fallback' },
		['<Left>'] = { 'snippet_forward', 'fallback' },

		['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

		['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
	}
})
require "copilot".setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		hide_during_completion = vim.g.ai_cmp,
		keymap = {
			next = "<M-]>",
			prev = "<M-[>",
			accept = "<M-l>",
			accept_word = "<M-,>",
			dismiss = "<C-]>",
		},
	},
	panel = { enabled = false },
	copilot_model = "gpt-5-mini",
	filetypes = {
		markdown = true,
		tex = true,
		help = true,
	},
})


vim.lsp.enable({ "lua_ls", "clangd", "markdown_oxide", "matlab_ls", "zls", "pyright", "tinymist" })
vim.diagnostic.config({
		virtual_text = true, -- text on the right (true to enable)
		-- virtual_lines = { -- additional virtual line below the one with the diagnostic
		-- 	current_line = false -- show only when cursor is on the current diagnostic line
		-- }
}) 

-- theme
require("onedarkpro").setup({
	plugins = {
		all = false
	}
})
-- vim.cmd([[colorscheme gruber-darker]])
-- vim.cmd([[colorscheme vaporwave]])
vim.cmd([[colorscheme gruvbox]])
-- vim.cmd([[colorscheme monochrome]])
-- vim.cmd([[hi statusline guibg=NONE]])


-- Get the list of available color schemes, then 
-- define a keymap (leader + cs) to set the next color scheme in the list
-- and loop back to the start when reaching the end of the list. 
-- The list should be get from the vim.g.colors_name variable.
local themes = vim.fn.getcompletion("", "color")
local current_theme_index = 1
vim.keymap.set("n", "<leader>cs", function()
	current_theme_index = current_theme_index + 1
	if current_theme_index > #themes then
		current_theme_index = 1
	end
	vim.cmd("colorscheme " .. themes[current_theme_index])
	-- print the name of the current color scheme
	print("Color scheme: " .. themes[current_theme_index])
end, { desc = "Cycle color schemes" })
-- use leader + cS to go backwards
vim.keymap.set("n", "<leader>cS", function()
	current_theme_index = current_theme_index - 1
	if current_theme_index < 1 then
		current_theme_index = #themes
	end
	vim.cmd("colorscheme " .. themes[current_theme_index])
	print("Color scheme: " .. themes[current_theme_index])
end, { desc = "Cycle color schemes backwards" })


