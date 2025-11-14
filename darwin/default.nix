{
  inputs,
  nixpkgs,
  nix-darwin,
  home-manager,
  catppuccin
}:

let
  vars = {
    user = "jarad.dingman";
    home = "/Users/jarad.dingman";
  };
  systemConfig = system: {
    system = system;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };
in
{
  mac = let
    inherit (systemConfig "aarch64-darwin") system pkgs;
  in nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit inputs system vars; };
    modules = [
      ./configuration.nix
      home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs          = true;
          useUserPackages        = true;
          extraSpecialArgs       = { inherit vars; };
          users."${vars.user}".imports = [
            ./home.nix
            catppuccin.homeManagerModules.catppuccin
          ];
        };
      }
    ];
  };
}
