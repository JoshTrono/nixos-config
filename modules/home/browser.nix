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
      pkgs.chromium
      # pkgs.librewolf
    ]
  );
}
