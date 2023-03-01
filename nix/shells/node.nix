with (import <nixpkgs> { });

mkShell { buildInputs = [ nixfmt yarn nodejs-16_x ]; }
