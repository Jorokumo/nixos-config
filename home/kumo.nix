{ config, pkgs, username, ... }:

{

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
	
    ];

    programs.home-manager.enable = true;
}
