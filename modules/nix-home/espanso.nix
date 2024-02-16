{ config, pkgs, ... }: {
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
          trigger = ":lcfi";
          replace = "Leverhulme Centre for the Future of Intelligence";
        }
        {
          trigger = ":cfi";
          replace = "Centre for the Future of Intelligence";
        }
        {
          trigger = ":cam";
          replace = "University of Cambridge";
        }
        {
          trigger = ":jrc";
          replace = "Joint Research Centre";
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
