require("cc.set")
require("cc.remap")
require("cc.lazy_init")

local augroup = vim.api.nvim_create_augroup
local chaand = augroup('cc', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- Reloads a Lua module without restarting Neovim.
function R(name)
    require("plenary.reload").reload_module(name)
end

-- When you yank (copy) text, it quickly highlights what you copied.
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Building features like IDE
-- gd = it will go the definition of the function
-- K  = it will open the documentation of the function/variable
-- vws= search for any symbol in the entire project workspace
-- vd = view diagnostics
-- vca= Opens a menu of code actions recommended by the LSP.
-- vrr=
-- vrn= Renames a variable/function/class everywhere in your project - safely.
-- c-h= Shows function parameter hints while typing.
-- [d = previous warning
-- ]d = next warning
autocmd('LspAttach', {
    group = chaand,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

autocmd("CursorHold", {
    callback = function()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        for _, client in ipairs(clients) do
            if client.server_capabilities.documentHighlightProvider then
                vim.lsp.buf.document_highlight()
                return
            end
        end
    end,
})

autocmd("CursorMoved", {
    callback = function()
        vim.lsp.buf.clear_references()
    end,
})

vim.api.nvim_create_user_command("DiffOrig", function()
    vim.cmd("vert new")
    vim.cmd("setlocal buftype=nofile")
    vim.cmd("read #")
    vim.cmd("normal! 1Gdd")
    vim.cmd("diffthis")
    vim.cmd("wincmd p")
    vim.cmd("diffthis")
end, {})
