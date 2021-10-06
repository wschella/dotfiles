{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [ 
    wget 
    vim
    htop
    git
    nixfmt
    iproute2
    tldr
    fzf
    which
  ];
  services.vscode-server.enable = true;
}