{ config, pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;  # sets $EDITOR to nvim

    plugins = with pkgs.vimPlugins; [
      # File tree
      nvim-tree-lua
      nvim-web-devicons   # icons for the file tree

      # Fuzzy finder
      telescope-nvim
      plenary-nvim        # dependency of telescope

      # Syntax highlighting
      nvim-treesitter.withAllGrammars

      # LSP
      nvim-lspconfig

      # Autocomplete
      nvim-cmp
      cmp-nvim-lsp        # LSP source for nvim-cmp
      cmp-buffer          # buffer words source
      cmp-path            # file path source
      luasnip             # snippet engine (required by cmp)
      cmp_luasnip         # snippet source for nvim-cmp

      # Status bar
      lualine-nvim

      # Which key (shows keybind hints)
      which-key-nvim

      # Colorscheme
      tokyonight-nvim
    ];

    extraConfig = ''
      luafile ${config.xdg.configHome}/nvim/init.lua
    '';
  };
}
