# Dotfiles

My dotfiles yo. They suck. Don't use em.

Using [dotter](https://github.com/SuperCuber/dotter) for management for now, which kinda sucks.

Using [starship](https://github.com/starship/starship) as a prompt.

## Setup

1. Clone this repository
2. Create a `.dotter/local.toml`, e.g. by doing `cp .dotter/local.example.toml .dotter/local.toml`
3. Install Rust
4. Install Dotter
5. Run `dotter deploy`

### For Nix

1. `cp /etc/nixos/ ./nix/machines/<hostname>`
2. `rm /etc/nixos/*`
3. `ln ./nix/machines/<hostname>/* /etc/nixos`
4. Edit to hearts content
