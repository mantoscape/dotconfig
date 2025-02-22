return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        -- theme support for other plugins
        -- https://github.com/catppuccin/nvim?tab=readme-ov-file#integrations
        integrations = {
          gitsigns = true,
          harpoon = true,
          mason = true,
          neotree = true,
          treesitter = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
          which_key = true,
        },
      })
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },

  {
    "marko-cerovac/material.nvim",
    lazy = true,
  },
}
