{ config, pkgs, catppuccin, vars, lib, ... }:

{
  imports = [ ../cli/catppuccin.nix ];

  home = {
    username      = "${vars.user}";
    homeDirectory = "${vars.home}";
    stateVersion  = "24.05";

    packages = with pkgs; [
      devenv imagemagick dnsutils

      onefetch

      nerd-fonts.zed-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };

  # App configurations for cli and a desktop app or two...
  programs = {

    direnv    = { enable = true; };

    home-manager.enable = true;
  };
}
