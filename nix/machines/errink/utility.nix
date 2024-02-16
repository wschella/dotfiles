{ config, pkgs, ... }: {
  imports = [
    (fetchTarball
      "https://github.com/nix-community/nixos-vscode-server/tarball/master")
  ];

  services.vscode-server.enable = true;
  
  users.defaultUserShell = pkgs.bash;
  programs.bash.shellInit = "source ~/.bashrc";

  environment.systemPackages = with pkgs; [
    dig
    fzf
    git
    htop
    iproute2
    ncdu
    nixfmt
    starship
    tldr
    vim
    wget
    which
    whois

    # Rust
    cargo
    rustc
    gcc # https://github.com/mozilla/nixpkgs-mozilla/issues/82

    # for fzf errors
    # https://github.com/NixOS/nixpkgs/issues/8398#issuecomment-186832814
    glibcLocales
  ];
}
