{lib, ...}:
{
    options.modules = lib.mkOption {
        type = lib.types.submodule ({lib, ...}: {
            options = {
                core = lib.mkOption {
                    type = lib.types.submodule {};
                    default = {};
                };
                desktop = lib.mkOption {
                    type = lib.types.submodule {};
                    default = {};
                };
                utils = lib.mkOption {
                    type = lib.types.submodule {};
                    default = {};
                };
                games = lib.mkOption {
                    type = lib.types.submodule {};
                    default = {};
                };
            };
        });
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
