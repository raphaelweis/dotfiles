local cmp = require 'cmp'

local opts = {
  mapping = require('cmp').mapping.preset.insert({
    ["<TAB>"] = cmp.mapping.select_next_item(),         -- next suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(),         -- next suggestion (for consistency)
    ["<C-k>"] = cmp.mapping.select_prev_item(),         -- previous suggestion
    ["<C-Space>"] = cmp.mapping.complete(),             -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),                    -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item.
  }),
}

return opts
