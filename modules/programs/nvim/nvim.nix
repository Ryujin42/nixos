{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withRuby = true;
    withPython3 = true;

    extraLuaConfig = ''
      vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
      vim.g.mapleader = " "

      -- bootstrap lazy and all plugins
      local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
      if not vim.uv.fs_stat(lazypath) then
        local repo = "https://github.com/folke/lazy.nvim.git"
        vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
      end
      vim.opt.rtp:prepend(lazypath)

      local lazy_config = require "configs.lazy"

      -- load plugins
      require("lazy").setup({
        {
          "NvChad/NvChad",
          lazy = false,
          branch = "v2.5",
          import = "nvchad.plugins",
        },
        { import = "plugins" },
      }, lazy_config)

      -- load theme
      dofile(vim.g.base46_cache .. "defaults")
      dofile(vim.g.base46_cache .. "statusline")

      require "options"
      require "autocmds"
      vim.schedule(function()
        require "mappings"
      end)
    '';
  };

  home.file = {
    ".config/nvim/lua" = {
      source = ./nvim/lua;   # a folder next to this .nix file
      recursive = true;
    };
  };

  home.packages = with pkgs; [
    git
    ripgrep
    fd
    gcc
    nodejs
    tree-sitter
    lua-language-server
    nil
    pyright
    xclip
  ];
}