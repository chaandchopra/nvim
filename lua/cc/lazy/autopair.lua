    return {
      {
        'windwp/nvim-autopairs',
        event = 'InsertEnter', -- Load the plugin when entering insert mode
        config = true,         -- Use default configuration
        -- Alternatively, for custom options:
        -- opts = {
        --   disable_filetype = { "TelescopePrompt", "vim" },
        --   -- Add other options as needed
        -- },
      },
      -- Other plugins...
    }
