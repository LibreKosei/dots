{config, pkgs, ...}:
{
    programs.java = {
        enable = true;
        package = pkgs.jdk21.override {enableJavaFX = true; };
    };

    home.packages = with pkgs; [
        jdt-language-server
        maven
        gradle
        jetbrains.idea-community-bin
        scenebuilder
    ];
}
