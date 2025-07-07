{ inputs, pkgs, ... }:
{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

  services.flatpak = {
    enable = true;
    packages = [
      "com.github.tchx84.Flatseal"
      "net.davidotek.pupgui2"
      # "com.usebottles.bottles"
      "io.github.flattool.Warehouse"
      # "io.github.everestapi.Olympus"
    ];
    overrides = {
      global = {
        # Force Wayland by default
        #Context.sockets = [
        #  "wayland"
        #  "!x11"
        #  "!fallback-x11"
        #];
      };
    };
  };
}
