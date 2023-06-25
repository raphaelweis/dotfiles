local M = {}

M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = "",
  }
}

M.abc = {
  n = {
    -- ["<C-h>"] = { "<C-U>TmuxNavigateLeft<cr>", "Move cursor to left window (or tmux pane)" },
    -- ["<C-j>"] = { "<C-U>TmuxNavigateDown<cr>", "Move cursor to bottom window (or tmux pane)" },
    -- ["<C-k>"] = { "<C-U>TmuxNavigateUp<cr>", "Move cursor to top window (or tmux pane)" },
    -- ["<C-l>"] = { "<C-U>TmuxNavigateRight<cr>", "Move cursor to right window (or tmux pane)" },
  },

  i = {
     ["jk"] = { "<ESC>", "escape insert mode" , opts = { nowait = true }},
  },
}

return M
