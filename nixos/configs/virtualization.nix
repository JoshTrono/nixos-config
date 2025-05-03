{ pkgs, lib, config, ... }: {

  services.open-webui.enable = true;
  services.ollama.enable = true;
  programs.virt-manager.enable = true;

  users.groups.libvirtd.members = [ "joshua" ];

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };

    libvirtd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    dive
    podman-tui
    docker-compose
    distrobox

  ];
}
