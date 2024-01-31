{userSettings, pkgs,...}:
{
  programs.git = {
    enable = true;
    userName  = userSettings.name;
    userEmail = userSettings.email;
    package = pkgs.gitFull;
    extraConfig = {
      credential.helper = "${ pkgs.git.override { withLibsecret = true; } }/bin/git-credential-libsecret";
    };    
  };
 home.packages = with pkgs; [
    tk
    gh    

  ];
}
