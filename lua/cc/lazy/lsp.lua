return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    -- AI & CHAT INTEGRATION
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false }, -- Using cmp-copilot instead
          panel = { enabled = false },
        })
      end,
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      branch = "main",
      dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
      opts = { debug = false },
      keys = {
        { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
        { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
      },
    },
    { "zbirenbaum/copilot-cmp", config = function() require("copilot_cmp").setup() end },
    -- RUST ENHANCEMENT
    { "simrat39/rust-tools.nvim" }, 
  },

  config = function()
    local cmp = require('cmp')
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",      -- Python
        "ts_ls",        -- JS/TS
        "rust_analyzer",-- Rust
        "html",
        "cssls",
        "lua_ls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup { capabilities = capabilities }
        end,

        ["rust_analyzer"] = function()
          -- rust-tools handles the setup for better inlay hints and debugging
          require("rust-tools").setup({
            server = { capabilities = capabilities }
          })
        end,

        ["lua_ls"] = function()
          require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = { Lua = { diagnostics = { globals = { "vim" } } } }
          }
        end,
      }
    })

    -- Autocomplete (The "VS Code" style menu)
    cmp.setup({
      snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "copilot", group_index = 2 },
        { name = 'nvim_lsp', group_index = 2 },
        { name = 'luasnip', group_index = 2 },
      }, {
        { name = 'buffer' },
        { name = 'path' },
      })
    })

    -- Hover and Diagnostics
    vim.diagnostic.config({
      virtual_text = { prefix = '●' },
      update_in_insert = false,
      float = { border = "rounded" },
    })
  end
}
