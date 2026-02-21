-- ~/.config/nvim/lua/plugins/oil.lua
return {
    "stevearc/oil.nvim",
    opts = {},
    -- Optional dependency (highly recommended for icons)
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true, -- replace netrw
            delete_to_trash = true, -- macOS/Windows friendly
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true, -- show dotfiles
            },
            float = {
                padding = 6,
                max_width = 90,
                max_height = 30,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            keymaps = {
                ["q"] = "actions.close",
                ["<C-c>"] = "actions.close",
                ["<Esc>"] = "actions.close",
                ["<leader>t"] = "actions.open_terminal",
                ["gy"] = "actions.yank_entry",
                ["<leader>gy"] = {
                    desc = "Copy filepath to system clipboard",
                    callback = function()
                        require("oil.actions").copy_entry_path.callback()
                        vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
                    end,
                },
                ["<leader>e"] = {
                    desc = "Open in Windows Explorer",
                    callback = function()
                        -- Get the current directory oil is viewing
                        local dir = require("oil").get_current_dir()
                        if dir then
                            -- Convert the WSL path to a Windows path
                            local win_path = vim.fn.system({ "wslpath", "-w", dir })
                            -- Trim whitespace/newlines
                            win_path = vim.trim(win_path)

                            -- Open explorer.exe with the converted path
                            -- detach=true prevents the terminal window from flashing/blocking
                            vim.fn.jobstart({ "explorer.exe", win_path }, { detach = true })
                        end
                    end,
                },
            },
        })

        -- Optional: open parent directory with `-` in normal mode (like vinegar.vim)
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        -- Optional: open floating Oil from anywhere
        vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Oil float" })
    end,
}
