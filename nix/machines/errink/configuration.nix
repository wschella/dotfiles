{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./utility.nix

    ./site.nix
    ./nextcloud.nix
    ./forgejo.nix
    # ./pinocchio.nix
  ];

  networking.hostName = "errink";
  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Europe/Brussels";
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "/dev/sda" ];

  # https://nixos.wiki/wiki/Visual_Studio_Code
  programs.nix-ld.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens3.useDHCP = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  networking.firewall.allowedUDPPorts = [ ];
  # https://nixos.wiki/wiki/Nginx
  services.nginx = {
    enable = true;
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "wout.schellaert@gmail.com";
  };

  # Initial empty root password for easy login:
  users.users.root.initialHashedPassword = "";
  services.openssh.settings.PermitRootLogin = "prohibit-password";

  services.openssh.enable = true;

  users.users.wout = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    home = "/home/wout";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB+wCwIJD2BfONCWZshxnnEZN+nJ0vZmACg/TYGlsmTXiMASSOPcA2WKQ9OKIYo7C1yUd/p2MoIX4pA3zGJm8GnXJgfMPNxUImU0iExgcnhT9AKDUAZgU/7jsl2vPer3AZN3Ed8tHSBecmYZS6clELJf4Nspu+fHkfs+P3Y9St+vHGrq4Gn22rQdIB0wrb9GacDhSHj18/0ANzAUa9/G7ScG5bzVg0KMDz/Q+r9wjQHRhXuQuXvd98sctudHn47+X5+7jpI8biROvum35/3C7HUlRsFT4vrTmw2gH2PXaS23nO5MvsOwcK/kA1yB6XcKgv9hx274cUZdD4eiGV7w9zo2+YIQK52KQ15nTE77hQJUttUz9meId5hEOzNzKrjqQwHnLE94mCxYEowiLdeCuhWMGzug0aML82WcW4PJbe16iC86jAql/X4+18EdwsQ0B6d0UvPAZV1OXHrYYsJy8I/U2XhnnJ1vtcPLGzSubGl/XcCxEkOpqidRbFEZjHDolwCw3KtHeAS/M0G0iSmi4am4Y/AxRPRJQo+JwEIzyXutWSRUsdG/nCbsZoyk/BrsWvPCbvD3vSgLD6xfqjLDf9x6dyG1ZSLRdodcysTIIK4sAW+v78crR9PUkceLbf8BXTRJu64nf3KYAZOhFVPJtvh72629aleFpsujUJJw== wout.schellaert@shu"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCps7DFtt32r/UUB+7dIB48BkMww3ENvFsH8kXvJH7fVpuwLKHcWBFXkMvrpFYpmf8zYT07Vy1wmUBk65NNCtLBW2+OTyvAlXnn/uxqzM9jNmxQroC7C3er+JfaOpY7+5AlBYlO9Nd/rgOSBW5mxM1DVQ/RBXZc96AhbT+XlCvy2KRr0Flfa7y5GPfcjlC8UtvETqIat/Cg+s1V3nI2fGYlkFBK0DovaqPFoA1hgpCNErD0kzEK1XMJ68QRYwPDP+af7ql3K+v81PXMnc8Nfm+EvDrPtnWJjjMVgGCZBnOL5CPGIKA1YFQlRAr8fSl3yFrUebBy+0do6oMmpT0E9ayoUXlw5lYnK22ksIY9v9iDrcKv6wtVqLkRA4dLs8w2jA9rFMosqyhoDbqG+5GzwJ++czt7Mv3F4XhflX4y38/J/mDTJk7M0Hj1YnDQGICfLP9AXe3iX6Wgm3ppvmhBHySnr9Cw7wkBzXCkvGI2JbTUJ8SH2GmCaF9rYqGdHnGvcrixD5Df8sB/YXNkyAz+uPVYTzjtDRwfMhxOlmsznk/5+r7PtuZJIluj2yItfH9w8sUP3HiWw5DhrblWQplgttUze2CC8NQwi3j91nxIafxZyq9Dw41s/mVqOvzITltUqpv3d2V01Up8OqrhC14pVqLioAW5LjgrxRFn/ZDu/gqpvw== wout@wuanti"
    ];
  };

  users.users.root = {
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB+wCwIJD2BfONCWZshxnnEZN+nJ0vZmACg/TYGlsmTXiMASSOPcA2WKQ9OKIYo7C1yUd/p2MoIX4pA3zGJm8GnXJgfMPNxUImU0iExgcnhT9AKDUAZgU/7jsl2vPer3AZN3Ed8tHSBecmYZS6clELJf4Nspu+fHkfs+P3Y9St+vHGrq4Gn22rQdIB0wrb9GacDhSHj18/0ANzAUa9/G7ScG5bzVg0KMDz/Q+r9wjQHRhXuQuXvd98sctudHn47+X5+7jpI8biROvum35/3C7HUlRsFT4vrTmw2gH2PXaS23nO5MvsOwcK/kA1yB6XcKgv9hx274cUZdD4eiGV7w9zo2+YIQK52KQ15nTE77hQJUttUz9meId5hEOzNzKrjqQwHnLE94mCxYEowiLdeCuhWMGzug0aML82WcW4PJbe16iC86jAql/X4+18EdwsQ0B6d0UvPAZV1OXHrYYsJy8I/U2XhnnJ1vtcPLGzSubGl/XcCxEkOpqidRbFEZjHDolwCw3KtHeAS/M0G0iSmi4am4Y/AxRPRJQo+JwEIzyXutWSRUsdG/nCbsZoyk/BrsWvPCbvD3vSgLD6xfqjLDf9x6dyG1ZSLRdodcysTIIK4sAW+v78crR9PUkceLbf8BXTRJu64nf3KYAZOhFVPJtvh72629aleFpsujUJJw== wout.schellaert@shu"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCps7DFtt32r/UUB+7dIB48BkMww3ENvFsH8kXvJH7fVpuwLKHcWBFXkMvrpFYpmf8zYT07Vy1wmUBk65NNCtLBW2+OTyvAlXnn/uxqzM9jNmxQroC7C3er+JfaOpY7+5AlBYlO9Nd/rgOSBW5mxM1DVQ/RBXZc96AhbT+XlCvy2KRr0Flfa7y5GPfcjlC8UtvETqIat/Cg+s1V3nI2fGYlkFBK0DovaqPFoA1hgpCNErD0kzEK1XMJ68QRYwPDP+af7ql3K+v81PXMnc8Nfm+EvDrPtnWJjjMVgGCZBnOL5CPGIKA1YFQlRAr8fSl3yFrUebBy+0do6oMmpT0E9ayoUXlw5lYnK22ksIY9v9iDrcKv6wtVqLkRA4dLs8w2jA9rFMosqyhoDbqG+5GzwJ++czt7Mv3F4XhflX4y38/J/mDTJk7M0Hj1YnDQGICfLP9AXe3iX6Wgm3ppvmhBHySnr9Cw7wkBzXCkvGI2JbTUJ8SH2GmCaF9rYqGdHnGvcrixD5Df8sB/YXNkyAz+uPVYTzjtDRwfMhxOlmsznk/5+r7PtuZJIluj2yItfH9w8sUP3HiWw5DhrblWQplgttUze2CC8NQwi3j91nxIafxZyq9Dw41s/mVqOvzITltUqpv3d2V01Up8OqrhC14pVqLioAW5LjgrxRFn/ZDu/gqpvw== wout@wuanti"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}

