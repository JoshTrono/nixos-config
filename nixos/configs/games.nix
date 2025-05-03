{ pkgs, ... }: {
  hardware.graphics.extraPackages = with pkgs; [ rocmPackages.clr.icd ];
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  environment.systemPackages = with pkgs; [
    steam
    steamtinkerlaunch
    mangohud
    gamemode
    gamescope
    heroic
    unstable.protonplus
    wine
    protontricks
    winetricks
  ];
  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  hardware.xone.enable = true;
}
