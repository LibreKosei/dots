{config, pkgs, ...}:
{
    programs.nix-ld = {
        enable = true;
        libraries = with pkgs; [
            libGL
            xorg.libXxf86vm
            glib
            gtk3
            xorg.libX11
            xorg.libXrender
            xorg.libXcursor
            xorg.libXrandr
            xorg.libXext
            atk
            cairo
            pango
            fontconfig
            freetype
            alsa-lib
        ];
    };
}
