{config, lib, ...}:
let 
    cfg = config.modules.core.vm;
in
{
    options.modules.core.vm = {
        enable = lib.mkEnableOption "virt-manager config";
    };

    config = lib.mkIf cfg.enable {
        dconf.settings = {
            "org/virt-manager/virt-manager/connections" = {
                autoconnect = ["qemu:///system"];
                uris = ["qemu:///system"];
            };
        };
    };
}
