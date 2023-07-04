with (import <nixpkgs> { });

mkShell { buildInputs = [ nixfmt yarn nodejs-18_x ]; }
