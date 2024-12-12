{ config, pkgs, ... }: {
  # https://wiki.nixos.org/wiki/Forgejo

  services.nginx = {
    virtualHosts."git.schellaert.org" = {
      forceSSL = true;
      enableACME = true;
      extraConfig = ''
        client_max_body_size 512M;
      '';
      locations."/".proxyPass = "http://localhost:${toString 3000}";
    };
  };

  # users.users.forgejo = {
  #   extraGroups = [ "storage" ];
  # };

  services.forgejo = {
    enable = true;
    database.type = "postgres";
  
    # Enable support for Git Large File Storage
    lfs.enable = true;
    
    # Store in a different place
    # stateDir = "/mnt/storagebox-jackt/forgejo"; # Doesn't work because conf/locale tries to symlink
    repositoryRoot = "/mnt/storagebox-jackt/forgejo/repositories";
    lfs.contentDir = "/mnt/storagebox-jackt/forgejo/data/lfs";

    settings = {
      server = {
        DOMAIN = "git.schellaert.org";
        # You need to specify this to remove the port from URLs in the web UI.
        ROOT_URL = "https://git.schellaert.org/"; 
        HTTP_PORT = 3000;
      };

      # You can temporarily allow registration to create an admin user.
      service.DISABLE_REGISTRATION = true; 

      # Add support for actions, based on act: https://github.com/nektos/act
      # actions = {
      #   ENABLED = true;
      #   DEFAULT_ACTIONS_URL = "github";
      # };
      # Sending emails is completely optional
      # You can send a test email from the web UI at:
      # Profile Picture > Site Administration > Configuration >  Mailer Configuration 
      # mailer = {
      #   ENABLED = true;
      #   SMTP_ADDR = "mail.example.com";
      #   FROM = "noreply@${srv.DOMAIN}";
      #   USER = "noreply@${srv.DOMAIN}";
      # };
    };
    # mailerPasswordFile = config.age.secrets.forgejo-mailer-password.path;
  };
}