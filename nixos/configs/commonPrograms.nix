{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    microsoft-edge
    discord
    vscode
    gnome-disk-utility
    git
    fastfetch
    unstable.jetbrains.rider
    android-studio
    nixfmt
    openjdk17
    protonplus
    direnv
    gnome-online-accounts-gtk
    unstable.umu-launcher
  ];
  services.gnome.gnome-online-accounts.enable = true;
  programs.npm.enable = true;
  programs.firefox.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  services = {
    power-profiles-daemon.enable = true;

    upower.enable = true;
    flatpak.enable = true;
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
  };
}
