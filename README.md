## Nix conf

My nix config files.

### Install

Install the package and system management tools

- [Nix install](https://nixos.org/download/#nix-install-macos)
  - [Nix-darwin](https://github.com/LnL7/nix-darwin/)
- [Brew install](https://brew.sh/)
  - `xcode-select --install` is slow as ass

Finally, to finish the setup run:

```bash
$ nix --extra-experimental-features "nix-command flakes" run nix-darwin/master#darwin-rebuild -- switch --flake .#mac
```

after that nix command runs you should be able to reload with:

`darwin-reload switch --flake .#mac`

##### Why brew and nix?

I don't like how nix manages gui apps.
I like keeping those apps updated to latest and that is difficult with
nix as it can require updating the flake.lock file. In my mind because I
am pinned to unstable it should always update to the latest version. But
it doesn't work that way so here we are.
