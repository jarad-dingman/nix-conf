{ inputs, pkgs, vars, ... }:

{
  security.pam.services.sudo_local.touchIdAuth = true;

  imports = [ ./settings.nix];

  users.users.${vars.user} = {
    home  = "${vars.home}";
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true; # The above might make this unnecessary
  environment = {
    variables = {
      EDITOR         = "nvim";
      SYSTEMD_EDITOR = "nvim";
      VISUAL         = "zed";
    };
    systemPackages = with pkgs; [
      age git vim zsh neovim
    ];
  };

  services.yabai = import ../services/yabai.nix { inherit pkgs; };

  nix = {
    package = pkgs.nix;
    optimise.automatic = true;
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    settings.trusted-users = [
      "root"
      "jarad.dingman"
      "@wheel"
    ];
    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
      extra-platforms = x86_64-darwin aarch64-darwin
    '';
  };
}
