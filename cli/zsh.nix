{ ... }:

{
  enable = true;
  enableCompletion = true;

  shellAliases = {
    cat  = "bat";
    ls   = "eza";
    find = "fd";
  };

  profileExtra = ''
    export GPG_TTY=$(tty)
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';

  autosuggestion.enable     = true;
  syntaxHighlighting.enable = true;
}
