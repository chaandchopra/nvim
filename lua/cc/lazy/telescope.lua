return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.5",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

        vim.keymap.set('n', '<c-p>', builtin.git_files, {})

        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("grep > ") })
        end)

        local marked_files = {}

        function MarkFile()
            local file = vim.fn.expand("%:p")
            table.insert(marked_files, file)
            print("Marked: " .. file)
        end

        function JumpToMark(n)
            local file = marked_files[n]
            if file then
                vim.cmd("edit " .. file)
            else
                print("No file in slot " .. n)
            end
        end

        function PickMarkedFiles()
            require("telescope.pickers").new({}, {
                prompt_title = "Marked Files",
                finder = require("telescope.finders").new_table {
                    results = marked_files,
                },
                sorter = require("telescope.config").values.generic_sorter({}),
                attach_mappings = function(_, map)
                    map("i", "<CR>", function(prompt_bufnr)
                        local entry = require("telescope.actions.state").get_selected_entry()
                        require("telescope.actions").close(prompt_bufnr)
                        vim.cmd("edit " .. entry.value)
                    end)
                    map("n", "<CR>", function(prompt_bufnr)
                        local entry = require("telescope.actions.state").get_selected_entry()
                        require("telescope.actions").close(prompt_bufnr)
                        vim.cmd("edit " .. entry.value)
                    end)
                    return true
                end,
            }):find()
        end

        -- Keymaps for marking
        vim.keymap.set("n", "<leader>a", MarkFile, {})
        vim.keymap.set("n", "<leader>h", PickMarkedFiles, {})
        vim.keymap.set("n", "<leader>1", function() JumpToMark(1) end)
        vim.keymap.set("n", "<leader>2", function() JumpToMark(2) end)
        vim.keymap.set("n", "<leader>3", function() JumpToMark(3) end)
        vim.keymap.set("n", "<leader>4", function() JumpToMark(4) end)
    end
}


