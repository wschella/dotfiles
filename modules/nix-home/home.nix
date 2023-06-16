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

    # Quality of life
    pkgs.starship
    pkgs.fzf
    pkgs.ncdu
    pkgs.tldr
    pkgs.github-copilot-cli
    pkgs.espanso
    pkgs.ripgrep-all

    # Applications / tools
    pkgs.zotero
    pkgs.lrzip
    pkgs.scrcpy
    pkgs.parallel
    pkgs.hollywood

    # New

    # pkgs.texlive.combined.scheme-full # It's not too bad 3.5G.
    # pkgs.eid-mw Does not work well with firefox

    # for fzf errors
    # https://github.com/NixOS/nixpkgs/issues/8398#issuecomment-186832814
    pkgs.glibcLocales
  ];
}
