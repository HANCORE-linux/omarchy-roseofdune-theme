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
        purple     = "#78292e",   -- control keywords (Wine)
        brown      = "#6e4a3a",   -- deprecated / special (Braun)

        bright_red    = "#a02b16",
        bright_yellow = "#713a56",
        bright_green  = "#76661d",
        bright_cyan   = "#76634c",
        bright_blue   = "#9e4f5b",
        bright_purple = "#78292e",

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
        -- brackets/parens/braces: rose-black (distinct from the gold gitsigns/commit color)
        hl["@punctuation.bracket"] = { fg = "#33252b" }
        hl["@punctuation.special"] = { fg = "#33252b" }
        -- keywords: aether renders these lilac internally -> force to palette.
        -- general keywords -> mauve; exceptions (try/except/raise) -> wine slot
        local kw = { fg = "#713a56" }
        for _, g in ipairs({
          "Keyword", "Conditional", "Repeat", "Statement", "Include", "StorageClass",
          "@keyword", "@keyword.function", "@keyword.operator", "@keyword.return",
          "@keyword.conditional", "@keyword.repeat", "@keyword.import",
          "@keyword.coroutine", "@conditional", "@repeat", "@include",
        }) do
          hl[g] = kw
        end
        local kw_exc = { fg = "#78292e" }
        for _, g in ipairs({ "Exception", "@keyword.exception", "@exception" }) do
          hl[g] = kw_exc
        end
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
