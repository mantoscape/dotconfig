return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  config = function()
    require("neo-tree").setup({
      -- The following are some of the available settings
      -- You can call `:lua require("neo-tree").paste_default_config()` to
      -- paste in the current file the documented default config.

      -- If a user has a sources list it will replace this one.
      -- Only sources listed here will be loaded.
      -- You can also add an external source by adding it's name to this list.
      -- The name used here must be the same name you would use in a require() call.
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      -- If the root node is hidden, keep the indentation anyhow.
      -- This is needed if you use expanders because they render in the indent.
      retain_hidden_root_indent = true,
      popup_border_style = "rounded",
      source_selector = {
        sources = {
          { source = "filesystem" },
          { source = "document_symbols" },
          { source = "buffers" },
          { source = "git_status" },
        },
        winbar = true,
      },
      default_component_configs = {
        diagnostics = {
          symbols = {
            hint = "󰌵",
            info = " ",
            warn = " ",
            error = " ",
          },
          highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
          },
        },
      },
      window = {
        mappings = {
          -- Change 'toggle_node' from space to tab, since the first one is also the <leader>.
          ["<space>"] = "none",
          ["<tab>"] = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
        },
      },

      filesystem = {
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
            "node_modules",
          },
          never_show = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    vim.cmd.Neotree()
  end,
}
