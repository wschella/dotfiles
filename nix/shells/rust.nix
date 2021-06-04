with import <nixpkgs> { overlays = [ (import <rust-overlay>) ];};

mkShell {
  buildInputs = [
    nixfmt
    rust-bin.stable.latest.default
    gcc
    openssl pkg-config
  ];
}