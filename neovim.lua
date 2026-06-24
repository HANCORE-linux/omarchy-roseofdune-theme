return {
  {
    "bjarneo/aether.nvim",
    branch = "v3",
    name = "aether",
    priority = 1000,
    opts = {
      transparent = false,
      colors = {
        bg         = "#F5E6D3",
        dark_bg    = "#ecdcc6",
        darker_bg  = "#e3d2bb",
        lighter_bg = "#fdf7ee",

        fg         = "#35302a",
        dark_fg    = "#6b5e52",
        light_fg   = "#2a2620",
        bright_fg  = "#2a2620",
        muted      = "#8c7458",   -- comments (gedaempftes Taupe)

        -- roseofdune warm palette, distinkt ueber Hue/Helligkeit (alle AA auf cream):
        red        = "#a02b16",   -- errors (Terrakotta-Rot)
        orange     = "#9b5625",   -- numbers / constants (Terrakotta-Orange)
        yellow     = "#713a56",   -- keywords / types (Mauve)
        green      = "#76661d",   -- strings (Gold)
        cyan       = "#76634c",   -- members / fields (Taupe)
        blue       = "#9e4f5b",   -- functions / methods (Rose)
        purple     = "#8a3a52",   -- control keywords (Wine)
        brown      = "#6e4a3a",   -- deprecated / special (Braun)

        bright_red    = "#a02b16",
        bright_yellow = "#713a56",
        bright_green  = "#76661d",
        bright_cyan   = "#76634c",
        bright_blue   = "#9e4f5b",
        bright_purple = "#8a3a52",

        accent               = "#9e4f5b",
        cursor               = "#9e4f5b",
        foreground           = "#35302a",
        background           = "#F5E6D3",
        selection             = "#ddc3c9",
        selection_foreground = "#35302a",
        selection_background = "#ddc3c9",
      },
      on_highlights = function(hl, c)
        hl.CursorLine = { bg = "#ecdcc6" }
        hl.CursorLineNr = { fg = c.yellow, bold = true }
        hl.LspReferenceText = { bg = c.selection, fg = c.bright_fg }
        hl.LspReferenceRead = hl.LspReferenceText
        hl.LspReferenceWrite = hl.LspReferenceText
      end,
    },
    config = function(_, opts)
      require("aether").setup(opts)
      vim.cmd.colorscheme("aether")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "aether",
    },
  },
}
