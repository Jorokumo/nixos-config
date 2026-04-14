{ config, pkgs, ... }:

{

    programs.kitty = {

	enable = true;

	settings = {

	    font_family = "DepartureMono Nerd Font";
	    font_size = "12";

	    window_padding_width = 8;
	    background_opacity = "0.95";
	    confirm_os_window_close = 0;

	    tab_bar_style = "powerline";
	    tab_powerline_style = "slanted";
	};
    };
}
