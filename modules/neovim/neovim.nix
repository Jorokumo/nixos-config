{ config, pkgs, ... }:
{
    programs.nixvim = {
        enable = true;
        defaultEditor = true;
    
        colorschemes.kanagawa = {
            enable = true;
            settings = {

                theme = "wave";
                background.dark = "wave";
            };
        };
    
        opts = {
            number = true;
            relativenumber = true;
            shiftwidth = 4;
            tabstop = 4;
            expandtab = true;
            scrolloff = 8;
            smartindent = true;
            clipboard = "unnamedplus";
        };
    
        plugins = {
            web-devicons.enable = true;
      
            treesitter = {
                enable = true;
                settings = {
                    highlight.enable = true;
                    indent.enable = true;
                };
            };
      
            telescope = {
                enable = true;
                extensions.fzf-native.enable = true;
            };

            lualine = {

                enable = true;
                settings.options = {

                    theme = "kanagawa";
                    component_separators = "|";
                    section_separators = {

                        left = "";
                        right = "";
                    };
                };
            };

            nvim-tree = {
                enable = true;
                openOnSetup = true;
            };
        };

        keymaps = [
            {
                mode = "n";
                key = "<leader>e";
                action = ":NvimTreeToggle<CR>";
                options.desc = "Toggle file tree";
            }
            {
                mode = "n";
                key = "<leader>ff";
                action = ":Telescope find_files<CR>";
                options.desc = "Find files";
            }
            {
                mode = "n";
                key = "<leader>fg";
                action = ":Telescope live_grep<CR>";
                options.desc = "Search in files";
            }
            {
                mode = "n";
                key = "<leader>fb";
                action = ":Telescope buffers<CR>";
                options.desc = "Find buffers";
            }
        ];
    
        globals.mapleader = " ";
    };
}
