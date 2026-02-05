return {
  {
    "EdenEast/nightfox.nvim",
    priority = 1000, -- load before other plugins
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false, -- set true if you want transparent background
        },
      })

      vim.cmd("colorscheme dayfox")
	  vim.g.lightline = { colorscheme = "dayfox" }
    end,
  },
}
