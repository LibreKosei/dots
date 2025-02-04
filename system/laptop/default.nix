{options, config, pkgs, ...}:
{
    services.acpid.enable = true;
    
    services.logind = {
        lidSwitch = "suspend";
        lidSwitchDocked = "suspend";
    };
}
