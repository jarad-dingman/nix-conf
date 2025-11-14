{ inputs, pkgs, vars, ... }:

{
  security.pam.services.sudo_local.touchIdAuth = true;
  security.pki.certificates = [
    "/opt/nix-and-zscaler.crt"
  ];

  imports = [ ./settings.nix];

  system.primaryUser = "${vars.user}";

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
      git zsh
    ];
  };

  nix = {
    package = pkgs.nix;
    optimise.automatic = true;
    gc = {
      automatic = true;
      interval.Day = 7;
      options = "--delete-older-than 7d";
    };
    settings.ssl-cert-file = "/opt/nix-and-zscaler.crt";
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
