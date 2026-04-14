{ config, pkgs, username, ... }:

{

    imports = [
	      ../modules/home/neovim.nix
    ];

    # ------- Version ------- #
    home.stateVersion = "25.11";

    home.username = username;
    home.homeDirectory = "/home/${username}";

    # ------- init lua ------- #
    xdg.configFile."nvim/init.lua".source = ../nvim/init.lua;

    # ------- User Only Packages ------- #
    home.packages = with pkgs; [
	
        # --- Social --- #
	      vesktop

        # --- Extras --- #
	      fastfetch
        htop
	
    ];

    programs.home-manager.enable = true;
}
