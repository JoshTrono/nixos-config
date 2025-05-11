{ pkgs, ... }:
{
  #services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = false;
    alsa.support32Bit = false;
    pulse.enable = true;
    # lowLatency.enable = true;
  };
  hardware.alsa.enablePersistence = false;
  environment.systemPackages = with pkgs; [ pulseaudioFull ];
}
