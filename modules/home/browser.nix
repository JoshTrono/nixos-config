{
  inputs,
  pkgs,
  host,
  ...
}:
{
  home.packages = (
    with pkgs;
    [
      pkgs.firefox
      pkgs.brave
      # pkgs.chromium
      # pkgs.librewolf
    ]
  );
}
