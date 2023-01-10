local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("folke/tokyonight.nvim")
  use("ellisonleao/gruvbox.nvim")

  -- cmp plugins
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use("hrsh7th/cmp-nvim-lsp")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- LSP
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")
  use("neovim/nvim-lspconfig")
  use("jose-elias-alvarez/null-ls.nvim")

  -- indent line
  use("lukas-reineke/indent-blankline.nvim")

  -- terminal
  use("akinsho/toggleterm.nvim")

  -- telescope
  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })
  use({ "smartpde/telescope-recent-files" })
  -- nvim tree
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  })

  use("ahmedkhalf/project.nvim")

  use({
    "ThePrimeagen/refactoring.nvim",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  })

  -- highlight
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto pairs
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  use("nvim-lualine/lualine.nvim")

  -- trouble
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })

  use("glepnir/lspsaga.nvim")
  use({
    "numToStr/Comment.nvim",
  })

  use({
    "ray-x/navigator.lua",
    requires = {
      { "ray-x/guihua.lua", run = "cd lua/fzy && make" },
      { "neovim/nvim-lspconfig" },
    },
  })

  use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" })

  use("liuchengxu/vista.vim")

  use("glepnir/dashboard-nvim")

  use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })

  use("jayp0521/mason-nvim-dap.nvim")

  use("theHamsta/nvim-dap-virtual-text")

  use("EdenEast/nightfox.nvim") -- Packer

  use({
    "lewis6991/gitsigns.nvim",
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  })

  use("ggandor/leap.nvim")

  use("AckslD/nvim-neoclip.lua")

  use("karb94/neoscroll.nvim")

  use("folke/which-key.nvim")

  use({
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
  })

  use("navarasu/onedark.nvim")

  --
  -- use "p00f/nvim-ts-rainbow"
  -- use "nvim-treesitter/playground"
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
