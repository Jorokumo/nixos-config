{ config, pkgs, username, ... }:

{

    imports = [

	../modules/fish/fish.nix
	../modules/kitty/kitty.nix
	../modules/neovim/neovim.nix
    ];

    # ------- Version ------- #
    home.stateVersion = "25.11";

    home.username = username;
    home.homeDirectory = "/home/${username}";


    # ------- User Only Packages ------- #
    home.packages = with pkgs; [
	
        # --- Social --- #
	vesktop

        # --- Extras --- #
	fastfetch
        htop
	
	# --- Fonts --- #
	nerd-fonts.departure-mono
	
    ];

    programs.home-manager.enable = true;
}
