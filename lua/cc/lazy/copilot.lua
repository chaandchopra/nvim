return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },  -- Disable inline suggestions (we use cmp)
      panel = { enabled = false },       -- Disable panel (optional, enable if you want it)
      filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
        ["."] = true,  -- Enable in all other filetypes
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    opts = {},  -- copilot-cmp has minimal config; just setup() internally
  },
}
