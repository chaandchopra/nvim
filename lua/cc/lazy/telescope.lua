return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        'nvim-telescope/telescope-ui-select.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-live-grep-args.nvim',
    },

    config = function()
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        require('telescope').setup({})

        require("telescope").load_extension('fzf')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

        vim.keymap.set('n', '<leader><leader>', function()
            builtin.oldfiles({ cwd_only = true })
        end)

        vim.keymap.set('n', '<leader>fw', function()
            builtin.grep_string({ search = vim.fn.input("grep > ") })
        end)

        vim.keymap.set('n', '<c-p>', builtin.git_files, {})

        vim.keymap.set("n", "<space>gw", builtin.grep_string)

        --  6. Search within current buffer
        vim.keymap.set('n', '<leader>/', function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
            })
        end, { desc = "Fuzzy find in current buffer" })

        vim.keymap.set('n', '<leader>fn', function()
            -- Prompt the user for a filename first
            local file_name = vim.fn.input("Search Filename: ")
            if file_name == "" then return end

            builtin.find_files({
                query = file_name,
                search_file = file_name, -- This forces the match on the filename
            })
        end, { desc = "Find File (Name Only)" })
    end
}
