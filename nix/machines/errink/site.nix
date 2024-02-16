{ config, pkgs, ... }: {
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/services/web-servers/nginx/vhost-options.nix
  services.nginx.virtualHosts."schellaert.org" = {
    # addSSL = true;
    forceSSL = true;
    enableACME = true;
    default = true;
    root = "/var/www/schellaert.org";
    locations = {
      "/" = { tryFiles = "$uri $uri.html $uri/index.html index.html"; };
    };
    extraConfig = ''
      error_page 404 /404.html;
    '';
  };
}
