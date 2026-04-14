{ config, pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

    # ------- Bootloader ------- #
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # ------- Host ------- #
    networking.hostName = "jorokumo"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # ------- Network ------- #
    networking.networkmanager.enable = true;

    # ------- Locale ------- #
    time.timeZone = "America/Mazatlan";
    i18n.defaultLocale = "en_US.UTF-8";

    services.xserver.enable = true;

    # ------- Desktop Enviroment ------- #
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # ------- Keyboard ------- #
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # ------- Audio ------- #
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # ------- Users ------- #
    users.users.kumo = {
        isNormalUser = true;
        description = "Jorokumo";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
            kdePackages.kate
         #  thunderbird
        ];
    };

    # ------- Programs ------- #
    programs.firefox.enable = true;

    nixpkgs.config.allowUnfree = true;

    # ------- Packages ------- #
    environment.systemPackages = with pkgs; [
        git
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
     #  wget
    ];

    # ------- Version ------- #
    # ==== DO NOT CHANGE ==== #
    system.stateVersion = "25.11"; # Did you read the comment? yea duh.

}
