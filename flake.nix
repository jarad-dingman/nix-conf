{
  description = "Basic working nix configurations.";

  inputs = {
    nixpkgs.url                         = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url                      = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows   = "nixpkgs";
    home-manager.url                    = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    catppuccin.url                      = "github:catppuccin/nix";
  };

  outputs = inputs@{
    self, nixpkgs, nix-darwin, home-manager, catppuccin
  }: {
    darwinConfigurations = (import ./darwin {
      inherit inputs nixpkgs nix-darwin home-manager catppuccin;
    });
  };
}
