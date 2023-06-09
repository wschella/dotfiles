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

  home.packages = let extraNodePackages = import node/default.nix { };
  in [
    pkgs.nixfmt
    pkgs.starship
    pkgs.fzf
    pkgs.ncdu
    pkgs.zotero
    pkgs.espanso
    pkgs.vim
    pkgs.hollywood
    pkgs.tldr
    # pkgs.texlive.combined.scheme-full # It's not too bad 3.5G.
    # pkgs.eid-mw Does not work well with firefox
    pkgs.scrcpy
    pkgs.ripgrep-all
    pkgs.github-copilot-cli
  ];
}
