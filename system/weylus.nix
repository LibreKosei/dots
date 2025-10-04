{config, pkgs, ...}:
{
    programs.weylus = {
        enable = true;
        users = ["kosei"];
        openFirewall = true;
    };
}
