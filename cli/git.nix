{ pkgs, ... }:

{
  enable = true;
  delta = import ./delta.nix { inherit pkgs; };

  userName = "jarad-dingman";
  userEmail = "jarad.dingman@wgu.edu";

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
