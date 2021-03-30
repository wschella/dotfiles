with (import <nixpkgs> {});


mkShell {
  buildInputs = [
    nixfmt
    nodejs-14_x
  ];
}