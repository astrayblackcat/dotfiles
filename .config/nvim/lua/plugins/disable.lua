return {

  { "folke/snacks.nvim",
    opts = {
      indent = {
          enabled = false
      }
    }
  },
  { "saghen/blink.cmp",
    opts = {
      keymap = { preset = 'enter' },
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
