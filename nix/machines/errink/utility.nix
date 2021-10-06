{config, pkgs, ...}:
{
  imports =  [
      (fetchTarball "https://github.com/msteen/nixos-vscode-server/tarball/master")
  ];

  environment.systemPackages = with pkgs; [ 
    wget 
    vim
    htop
    git
    dig
    whois
    ping
    nixfmt
    iproute2
    tldr
    fzf
    which
    ncdu
    starship

    # Rust
    cargo
    rustc
    gcc # https://github.com/mozilla/nixpkgs-mozilla/issues/82

    # for fzf errors
    # https://github.com/NixOS/nixpkgs/issues/8398#issuecomment-186832814
    glibcLocales
  ];
  services.vscode-server.enable = true;
}
