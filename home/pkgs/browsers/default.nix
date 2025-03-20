{config, pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    ungoogled-chromium
    firefox
    inputs.zen-browser.packages."${system}".default
  ];
}
