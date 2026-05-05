return {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
        require("auto-save").setup({
            enabled = true,
            condition = function(buf)
                local fn = vim.fn
                local utils = require("auto-save.utils.data")

                if fn.getbufvar(buf, "&buftype") ~= "" then
                    return false
                end
                return true
            end,
            debounce_delay = 150,
            trigger_events = { "InsertLeave", "TextChanged" },
            write_all_buffers = false,
            noautocmd = false,
            notification = {
                enabled = false,
            },
        })
    end,
}
