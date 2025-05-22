{config, pkgs, ...}:
{
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["kosei"];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
}
