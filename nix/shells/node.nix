with (import <nixpkgs> { });

mkShell { buildInputs = [ nixfmt yarn nodejs_20 ]; }
