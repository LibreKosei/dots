{lib, ...}:
{
    options.modules = lib.mkOption {
        type = lib.types.submodule {
            freeformType = lib.types.attrsOf lib.types.anything;
        };
        default = {};
        description = "Custom system module namespace";
    };

    imports = [
        ./core 
        ./desktop 
        ./utils
        ./games
    ];
}
