{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [ bun ];
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix
  services.nginx.virtualHosts."dispatcher.schellaert.org" = {
    forceSSL = true;
    enableACME = true;
    locations = {
      "/" = {
        proxyPass = "http://127.0.0.1:8000/";
        recommendedProxySettings = true;
      };
      "/public" = { root = "/home/wout/pinocchio-dispatcher/public"; };
    };
  };
}
