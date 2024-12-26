return {
  { "saghen/blink.cmp",
    opts = {
      completion = {
        ghost_text = {
          enabled = false,
        },
        list = {
          selection = 'manual'
        }
      }
    }
  },
  { "folke/which-key.nvim", opts = { preset = "classic" }},
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "garymjr/nvim-snippets", enabled = false},
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false
      }
    }
  },
}
