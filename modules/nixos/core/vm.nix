{config, pkgs, lib, options, ...}:
let 
    cfg = config.modules.core.vm;
in 
{
    options.modules.core.vm = {
        enable = lib.mkEnableOption "Virtual Machine";
    };

    config = lib.mkIf cfg.enable {
        programs.virt-manager.enable = true;
        users.groups.libvirtd.members = ["kosei"];
        virtualisation.libvirtd = {
            enable = true;
            qemu = {
                package = pkgs.qemu_kvm;
                runAsRoot = true;
                swtpm.enable = true;
                # ovmf = {
                #     enable = true;
                #     packages = [(pkgs.OVMF.override {
                #         secureBoot = true;
                #         tpmSupport = true;
                #     }).fd];
                # };
            };
        };
        virtualisation.spiceUSBRedirection.enable = true;
        virtualisation.virtualbox.host.enable = true;
        users.extraGroups = {
            vboxusers.members = [ "kosei" ];
        };
    };
}
