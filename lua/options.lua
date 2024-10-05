require "nvchad.options"
require('flutter-tools').setup {}
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- require("copilot.vim.lua._copilot").setup {}
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
-- Create an autocmd group

-- autocmds.lua

-- Create an autocmd group
vim.api.nvim_create_augroup("fmt", { clear = true })

-- Define the autocmd
vim.api.nvim_create_autocmd("BufWritePre", {
    group = "fmt",
    pattern = "*",
    callback = function()
        -- Ensure that we only join undo history if there's a change

        -- if vim.fn.undotree().changes ~= 0 then
        --     vim.cmd("undojoin")
        -- end
        vim.cmd("Neoformat")
    end,
})
