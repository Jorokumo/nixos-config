{
    description = "My First NixOS Configuration";

    
    # ------- Inputs ------- #
    inputs = {

        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";


    # ------- Home Manager -------#
        home-manager = {

            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };

    # ------- NixVim ------- #
        nixvim = {

            url = "github:nix-community/nixvim/nixos-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };


    # ------- Outputs ------- #
    outputs = { self, nixpkgs, home-manager, nixvim, ...}:
    let

        system = "x86_64-linux";

        username = "kumo"; # Change this depending on your username
        hostname = "jorokumo"; # Change this depending on your hostname
    in {

        nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
	
            inherit system;

            modules = [

                ./system/configuration.nix

                home-manager.nixosModules.home-manager
                {

                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.${username} = import ./home/${username}.nix;
                    home-manager.extraSpecialArgs = { inherit username; };
                    home-manager.sharedModules = [

                        nixvim.homeModules.nixvim
                    ];
                }
            ];
        };    
    };
}
