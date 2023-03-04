local overrides = require "custom.plugins.overrides"

---@type {[PluginName]: NvPluginConfig|false}
local plugins = {

  ["goolord/alpha-nvim"] = { disable = false }, -- enables dashboard

  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["nvim-tree/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },

  -- Install a plugin
  -- ["max397574/better-escape.nvim"] = {
    -- event = "InsertEnter",
    -- setup = function()
      -- require("better_escape").setup()
    -- end,
  -- },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ['andweeb/presence.nvim'] = {
    config = function()
      require("presence").setup({
        neovim_image_text = "Neovim",
      })
    end,
  },

  ['wakatime/vim-wakatime'] = {},

  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}

return plugins
