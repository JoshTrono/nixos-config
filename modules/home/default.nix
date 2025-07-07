{inputs, username, host, ...}: {
  imports = [
    ./browser.nix
    ./gaming.nix
    ./kitty.nix
    ./obsidian.nix
    ./packages.nix
    ./retroarch.nix
    ./dev.nix
    ./ssh.nix
    ./git.nix
    ./lazygit.nix
  ];
}
