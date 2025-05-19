{ pkgs, ... }:

{
  enable = true;
  delta = import ./delta.nix { inherit pkgs; };

  userName = "Jarad Dingman";
  userEmail = "28451409+MisterBianco@users.noreply.github.com";

  extraConfig = {
    # Sign all commits using ssh key
    commit.gpgsign  = true;
    user.signingkey = "~/.ssh/id_ed25519.pub";
    gpg = {
      format = "ssh";
      ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };
  };
}
