{config, options, lib, ...}:
{
    programs.git = {
        enable = true;
        settings.user = {
            email = "cryptokell@tutanota.com";
            name = "LibreKosei";
        };
    };
}
