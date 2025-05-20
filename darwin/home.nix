{ config, pkgs, catppuccin, vars, ... }:

{
  imports = [ ../cli/catppuccin.nix ];

  home = {
    username      = "${vars.user}";
    homeDirectory = "${vars.home}";
    stateVersion  = "24.05";

    packages = with pkgs; [
      gum curl glow nixd nmap procs devenv
      imagemagick dnsutils tealdeer

      nerd-fonts.zed-mono
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];
  };

  # Will likely need to configure more gui apps here
  xdg.configFile = {
    "ghostty/config".source = ../apps/ghostty;
  };

  # App configurations for cli and a desktop app or two...
  programs = {
    # Gui applications
    # alacritty = import ../apps/alacritty.nix { inherit pkgs; };
    # ghostty   = import ../apps/ghostty.nix   { inherit pkgs; };

    # only required to be enabled
    bat       = { enable = true; };
    bottom    = { enable = true; };
    fd        = { enable = true; };
    ripgrep   = { enable = true; };
    ssh       = {
      enable         = true;
      addKeysToAgent = "yes";
      extraConfig    = ''
        UseKeychain yes
      '';
    };

    # enabled and added zsh hooks
    direnv    = { enable = true; enableZshIntegration = true; };
    eza       = { enable = true; enableZshIntegration = true; };
    fzf       = { enable = true; enableZshIntegration = true; };
    starship  = { enable = true; enableZshIntegration = true; };
    zoxide    = { enable = true; enableZshIntegration = true; };

    # extra configuration required
    git       = import ../cli/git.nix        { inherit pkgs; };
    jq        = import ../cli/jq.nix         { inherit pkgs; };
    topgrade  = import ../cli/topgrade.nix   { inherit pkgs; };
    zellij    = import ../cli/zellij.nix     { inherit pkgs; };
    zsh       = import ../cli/zsh.nix        { inherit pkgs; };

    home-manager.enable = true;
  };
}
