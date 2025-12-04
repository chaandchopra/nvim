vim.opt.guicursor = ""                   -- Use block cursor in all modes

vim.opt.nu = true                        -- Show absolute line numbers
vim.opt.relativenumber = true            -- Show relative line numbers

vim.opt.tabstop = 4                      -- Number of spaces per TAB character
vim.opt.softtabstop = 4                  -- Number of spaces inserted when pressing Tab in insert mode
vim.opt.shiftwidth = 4                   -- Number of spaces for indenting with >> or <<
vim.opt.expandtab = true                 -- Convert tabs to spaces

vim.opt.smartindent = true               -- Automatically indent new lines intelligently

vim.opt.wrap = false                     -- Disable line wrapping

vim.opt.swapfile = false                 -- Disable swapfile creation
vim.opt.backup = false                   -- Disable backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Set undo file directory
vim.opt.undofile = true                  -- Enable persistent undo across sessions

vim.opt.hlsearch = false                 -- Don't highlight search results after finishing a search
vim.opt.incsearch = true                 -- Show search matches as you type

vim.opt.termguicolors = true             -- Enable true color support

vim.opt.scrolloff = 8                    -- Keep 8 lines visible above/below the cursor when scrolling
vim.opt.signcolumn = "yes"               -- Always show the sign column (for LSP, Git, etc.)
vim.opt.isfname:append("@-@")            -- Allow @ and - in filenames

vim.opt.updatetime = 50                  -- Faster update time for CursorHold events, etc.

vim.opt.colorcolumn = "80"               -- Highlight column 80 as a visual guide

vim.opt.completeopt = {"menu", "menuone", "noselect"}
