return {

  { "echasnovski/mini.pairs", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "lukas-reineke/indent-blankline", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  { "garymjr/nvim-snippets", enabled = false},
  {
    "hrsh7th/nvim-cmp",
    opts = {
        experimental = { ghost_text = false }
    }
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false
      }
    }
  },
}
