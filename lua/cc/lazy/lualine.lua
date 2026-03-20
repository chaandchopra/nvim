local function project_name()
    local root = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    return '󱉭 ' .. root
end

return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        require("lualine").setup({
            options = {
                -- theme = "auto",
                theme = "rose-pine",
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
                lualine_a = { "filename" },
                lualine_b = { "branch" },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { project_name },
            }
        })
    end,
}
