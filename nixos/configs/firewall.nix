{...}: 
{
    networking.firewall = {
      enable = true;
      #AllowedTCPPorts = [ 80 443 ];
    };
}