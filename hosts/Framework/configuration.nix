# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs, outputs, lib, config, pkgs, host, ... }: 
  # You can import other NixOS modules here
  let
  flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  vars = import ./variables.nix;
in
{
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # outputs.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
    
    ../../modules/core/main.nix
    #../../modules/wm/plasma.nix
    ../../modules/wm/cosmic.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # Add overlays your own flake exports (from overlays and pkgs dir):
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  networking.hostName = vars.hostname;

  environment.sessionVariables = rec {
    DOTNET_ROOT = "$HOME/.dotnet";
    PATH = "$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools";
    DOTNET_SYSTEM_GLOBALIZATION_PREDEFINED_CULTURES_ONLY = "false";
  };


  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.11";
}

