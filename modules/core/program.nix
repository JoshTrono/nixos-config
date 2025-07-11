{ pkgs, lib, ... }:
{
  programs.dconf.enable = true;
  programs.gamemode.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    # pinentryFlavor = "";
  };
  
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [ icu ];
}
