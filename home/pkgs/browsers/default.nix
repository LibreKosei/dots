{config, pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
        ungoogled-chromium
        firefox
        floorp
        brave
        inputs.zen-browser.packages."${system}".default
    ];
}
