pkgs: {
  packages = with pkgs; [ nixfmt ];
  commands = [{
    name = "nix";
    help = pkgs.nixFlakes.meta.description;
    command = ''
      ${pkgs.nixFlakes}/bin/nix --experimental-features "nix-command flakes ca-references" "${"\${@}"}"
    '';
  }];
}
