# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nextcloud.nix
      (fetchTarball "https://github.com/msteen/nixos-vscode-server/tarball/master")
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.devices = [ "/dev/sda" ];

  networking.hostName = "brella"; # Define your hostname.

  time.timeZone = "Europe/Brussels";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp1s0.useDHCP = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  networking.firewall.allowedUDPPorts = [ ];
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    # Setup Nextcloud virtual host to listen on ports
    virtualHosts = {
      "nxt.schellaert.org" = {
        forceSSL = true;
        enableACME = true;
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    email = "wout.schellaert@gmail.com";
  };

  services.vscode-server.enable = true;

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

  # Initial empty root password for easy login:
  users.users.root.initialHashedPassword = "";
  services.openssh.permitRootLogin = "prohibit-password";

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = [
    # Replace this by your SSH pubkey!
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB+wCwIJD2BfONCWZshxnnEZN+nJ0vZmACg/TYGlsmTXiMASSOPcA2WKQ9OKIYo7C1yUd/p2MoIX4pA3zGJm8GnXJgfMPNxUImU0iExgcnhT9AKDUAZgU/7jsl2vPer3AZN3Ed8tHSBecmYZS6clELJf4Nspu+fHkfs+P3Y9St+vHGrq4Gn22rQdIB0wrb9GacDhSHj18/0ANzAUa9/G7ScG5bzVg0KMDz/Q+r9wjQHRhXuQuXvd98sctudHn47+X5+7jpI8biROvum35/3C7HUlRsFT4vrTmw2gH2PXaS23nO5MvsOwcK/kA1yB6XcKgv9hx274cUZdD4eiGV7w9zo2+YIQK52KQ15nTE77hQJUttUz9meId5hEOzNzKrjqQwHnLE94mCxYEowiLdeCuhWMGzug0aML82WcW4PJbe16iC86jAql/X4+18EdwsQ0B6d0UvPAZV1OXHrYYsJy8I/U2XhnnJ1vtcPLGzSubGl/XcCxEkOpqidRbFEZjHDolwCw3KtHeAS/M0G0iSmi4am4Y/AxRPRJQo+JwEIzyXutWSRUsdG/nCbsZoyk/BrsWvPCbvD3vSgLD6xfqjLDf9x6dyG1ZSLRdodcysTIIK4sAW+v78crR9PUkceLbf8BXTRJu64nf3KYAZOhFVPJtvh72629aleFpsujUJJw== wout.schellaert@shu"
  ];
}

