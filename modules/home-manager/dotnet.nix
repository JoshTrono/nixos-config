{ pkgs, ...}:
{

home.packages = with pkgs; [
   unstable.jetbrains.rider
   dotnet-sdk_8
#   dotnet-sdk_7

];


}
