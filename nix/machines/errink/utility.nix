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

    # Rust
    cargo
    rustc
    gcc
  ];
  services.vscode-server.enable = true;
}
