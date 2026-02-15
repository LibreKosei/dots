{lib, config, options, inputs, ...}:
let 
    cfg = config.modules.game.nixcraft;
in 
{
    options.modules.game.nixcraft = {
        enable = lib.mkEnableOption "Declarative Minecraft launcher with nixcraft";
        clientMods = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [];
            description = "Default client mods";
        };
        serverMods = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [];
            description = "Default server mods";
        };
    };

    config = lib.mkIf cfg.enable {
        imports = [ inputs.nixcraft.homeModules.default ];

        config.nixcraft = {
            enable = true;

            client = {
                shared = {
                    files."screenshot".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Pictures";
                    account = {
                        username = "";
                    };
                };
            };
        };
    };
}
