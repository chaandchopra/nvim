-- ~/.config/nvim/lua/plugins/oil.lua
return {
  "stevearc/oil.nvim",
  opts = {},
  -- Optional dependency (highly recommended for icons)
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,        -- replace netrw
      delete_to_trash = true,              -- macOS/Windows friendly
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,                -- show dotfiles
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
      },
    })

    -- Optional: open parent directory with `-` in normal mode (like vinegar.vim)
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    -- Optional: open floating Oil from anywhere
    vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Oil float" })
  end,
}
