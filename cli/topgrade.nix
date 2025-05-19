{ ... }:

{
  enable = true;
  settings = {
    misc = {
      assume_yes = true;
      disable = [
        "flutter"
        "node"
        # "brew_cask"
        # "brew_formula"
      ];
      set_title = false;
      cleanup = true;
    };
    commands = {
      "Run garbage collection on Nix store" = "nix-collect-garbage";
    };
  };
}
