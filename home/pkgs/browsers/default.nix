{config, pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
        ungoogled-chromium
        firefox
        brave
        inputs.zen-browser.packages."${system}".default
    ];
}
