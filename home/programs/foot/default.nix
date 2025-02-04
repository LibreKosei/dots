{config, options, lib, ...}:
{
  programs.foot = {
    enable = true;
    settings = {
      main.font = "monospace:size=13";
    };
  };
}
