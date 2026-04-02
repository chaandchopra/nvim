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


        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("grep > ") })
        end)

        vim.keymap.set('n', '<c-p>', builtin.git_files, {})

        vim.keymap.set("n", "<space>gw", builtin.grep_string)
    end
}
