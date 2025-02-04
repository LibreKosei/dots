{pks, ...}:
{
  services.udev.extraRules = ''
      #Enable user access to keyboard using uinput event generator
      SUBSYSTEM=="misc", KERNEL=="uinput", OPTIONS+="static_node=uinput", TAG+="uaccess"
  '';
}
