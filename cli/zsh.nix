{ ... }:

{
  enable = true;
  enableCompletion = true;

  shellAliases = {
    cat  = "bat";
    ls   = "eza";
    find = "fd";
  };

  profileExtra = ''export GPG_TTY=$(tty)'';

  autosuggestion.enable     = true;
  syntaxHighlighting.enable = true;
}
