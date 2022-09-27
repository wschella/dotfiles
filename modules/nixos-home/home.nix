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

  home.packages = [
    pkgs.wget
    pkgs.htop
    pkgs.vim
    pkgs.git
    pkgs.which
    pkgs.iproute2
    pkgs.nixfmt
    pkgs.fzf
    pkgs.ncdu
    pkgs.screen
    pkgs.tldr
    pkgs.starship
    pkgs.unrar

    # for fzf errors
    # https://github.com/NixOS/nixpkgs/issues/8398#issuecomment-186832814
    pkgs.glibcLocales
  ];
}
