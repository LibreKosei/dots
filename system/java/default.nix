{config, pkgs, ...}:
{
    programs.java = {
        enable = true;
        package = (pkgs.jdk21.override {enableJavaFX = true; }); 
    };
}
