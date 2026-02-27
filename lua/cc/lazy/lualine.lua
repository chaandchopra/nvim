return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            options = {
                -- theme = "auto",
                theme = "powerline_dark",
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- section_separators = "",
                -- component_separators = "",
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "filetype" },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            winbar = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename", "branch" },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            }
        })
    end,
}
