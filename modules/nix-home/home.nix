{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "wout";
  home.homeDirectory = "/home/wout";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.11";

  # Unrar is unfree
  # https://github.com/nix-community/home-manager/issues/856
  nixpkgs.config.allowUnfree = true;

  # Whether to enable settings that make Home Manager work better on GNU/Linux distributions other than NixOS.
  # https://nix-community.github.io/home-manager/options.html
  # We use it e.g. in the hope that `/home/wout/.nix-profile/share/applications/`,
  # where the .desktop files are located,  is added to the `XDG_DATA_DIRS` environment variable,
  # so that the desktop environment can find the .desktop files.
  # https://discourse.nixos.org/t/home-manager-installed-apps-dont-show-up-in-applications-launcher/8523
  # https://github.com/nix-community/home-manager/issues/1439
  # NOTE: This modifies stuff, and things break badly in ways I don't understand.
  # We do it manually in nixhomeprofile.sh instead now.
  # targets.genericLinux.enable = true;

  home.packages = [
    # Essentials
    pkgs.wget
    pkgs.htop
    pkgs.vim
    pkgs.which
    pkgs.iproute2
    pkgs.git
    pkgs.git-lfs
    pkgs.unrar
    pkgs.nixfmt
    pkgs.dotter
    pkgs.xclip

    # Quality of life
    pkgs.starship
    pkgs.fzf
    pkgs.ncdu
    pkgs.nvtop
    pkgs.tldr
    pkgs.github-copilot-cli
    pkgs.espanso
    pkgs.ripgrep-all

    # Applications / tools
    pkgs.lrzip
    pkgs.scrcpy
    pkgs.parallel
    pkgs.hollywood

    # Graphical
    pkgs.zotero
    # pkgs.masterpdfeditor
    pkgs.qbittorrent

    # New

    # pkgs.texlive.combined.scheme-full # It's not too bad 3.5G.
    # pkgs.eid-mw Does not work well with firefox

    # for fzf errors
    # https://github.com/NixOS/nixpkgs/issues/8398#issuecomment-186832814
    pkgs.glibcLocales
  ];

  services.espanso.enable = true;

  services.espanso.configs = {
    default = {
      backend = "Clipboard"; # Change to  Clipboard
      toggle_key = "RIGHT_ALT";
      search_shortcut = "ALT+SHIFT+SPACE";
      key_delay = 30;
      undo_backspace = false;
    };
  };
  services.espanso.matches = {
    base = {
      matches = [
        {
          trigger = ":upv";
          replace = "Universitat Politècnica de València";
          word = true;
        }
        {
          trigger = ":vrain";
          replace = "Valencian Research Institute for Artificial Intelligence";
        }
        {
          trigger = ":eur";
          replace = "€";
        }
        {
          trigger = ":date";
          replace = "{{mydate}}";
          vars = [{
            name = "mydate";
            type = "date";
            params = { format = "%d/%m/%Y"; };
          }];
        }
      ];
    };
    info = {
      matches = [
        {
          trigger = ":gmail";
          replace = "wout.schellaert@gmail.com";
        }
        {
          trigger = ":mail";
          replace = "wout@schellaert.org";
        }
        {
          trigger = ":upvmail";
          replace = "wschell@vrain.upv.es";
        }
        {
          trigger = ":phone be";
          replace = "0472603788";
        }
        {
          trigger = ":phone es";
          replace = "603675984";
        }
        {
          trigger = ":iban be";
          replace = "BE04891434115931";
        }
        {
          trigger = ":iban es";
          replace = "ES7400491736792610084091";
        }
        {
          trigger = ":iban zaak";
          replace = "BE54890204181997";
        }
        {
          trigger = ":visa";
          replace = "5163 8303 6410 0042";
        }
        {
          trigger = ":nie";
          replace = "Y8676496J";
        }
        {
          trigger = ":rrf";
          replace = "96.06.17-241.46";
        }
        {
          trigger = ":rrn";
          replace = "96061724146";
        }
        {
          trigger = ":passport";
          replace = "EP464139";
        }
        {
          trigger = ":idnr";
          replace = "592-1131216-83";
        }
        {
          trigger = ":isa idnr";
          replace = "591-9026729-11";
        }
        {
          trigger = ":btw";
          replace = "BE0802692222";
        }
      ];
    };
  };
}
