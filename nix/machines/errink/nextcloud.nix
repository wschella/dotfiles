{config, pkgs, ...}:
{
  # https://jacobneplokh.com/how-to-setup-nextcloud-on-nixos/
  services.nextcloud = {
    enable = true;
    hostName = "nxt.schellaert.org";
    package = pkgs.nextcloud22;
    config.extraTrustedDomains = [ "116.203.110.163" ];

    # Use HTTPS for links
    https = true;

    # Auto-update Nextcloud Apps
    autoUpdateApps.enable = true;
    # Set what time makes sense for you
    autoUpdateApps.startAt = "05:00:00";

    config = {
      # Further forces Nextcloud to use HTTPS
      overwriteProtocol = "https";

      # Nextcloud PostegreSQL database configuration, recommended over using SQLite
      dbtype = "pgsql";
      dbuser = "nextcloud";
      dbhost = "/run/postgresql"; # nextcloud will add /.s.PGSQL.5432 by itself
      dbname = "nextcloud";
      dbpassFile = "/var/nextcloud-db-pass";

      adminpassFile = "/var/nextcloud-admin-pass";
      adminuser = "admin";
    };
  };

  services.postgresql = {
    enable = true;

    # Ensure the database, user, and permissions always exist
    ensureDatabases = [ "nextcloud" ];
    ensureUsers = [
     { name = "nextcloud";
       ensurePermissions."DATABASE nextcloud" = "ALL PRIVILEGES";
     }
    ];
  };

  fileSystems."/mnt/storagebox-brella" = {
      device = "//u275045.your-storagebox.de/backup";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
        permission_opts = "uid=997,gid=998";
      in ["${automount_opts},${permission_opts},credentials=/etc/nixos/smb-secrets-brella"];
  };

  fileSystems."/mnt/storagebox-jackt" = {
      device = "//u293138.your-storagebox.de/backup";
      fsType = "cifs";
      options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";
        permission_opts = "uid=997,gid=998";
      in ["${automount_opts},${permission_opts},credentials=/etc/nixos/smb-secrets-jackt"];
  };

  systemd.services."nextcloud-setup" = {
    requires = ["postgresql.service"];
    after = ["postgresql.service"];
  };
}
