{config, pkgs, lib, ...}:
let
    cfg = config.modules.apps.nvim;    
    symlink = config.lib.file.mkOutOfStoreSymlink;
    home = config.home.homeDirectory;

    TSdeps = with pkgs; [
        gcc
        nodePackages.nodejs
        vimPlugins.nvim-treesitter.withAllGrammars
    ];

    lsp = with pkgs; [
        lua-language-server
        nixd
        typescript-language-server
        vscode-langservers-extracted
        pyright
        elixir-ls
        java-language-server
        jdt-language-server
        clang-tools
        lemminx
    ];

    packages = with pkgs; [
        deno
        qt6.qtdeclarative
    ];    
in
{
    options.modules.apps.nvim = {
        enable = lib.mkEnableOption "NvChad";
        languageServers = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = with pkgs; [
                lua-language-server
                nixd
            ];
            description = "Language servers to install.";
        };
        treesitter = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = with pkgs; [
                gcc
                nodePackages.nodejs
                vimPlugins.nvim-treesitter.allGrammars
            ];
        };
        extraPackages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = with pkgs; [
                qt6.qtdeclarative
            ];
        };
    };

    config = lib.mkIf cfg.enable {
        programs.neovim = {
            enable = true;
            withNodeJs = true;
            extraPackages = cfg.languageServers ++ cfg.treesitter ++ cfg.extraPackages;
        };
    };

    programs.neovim = {
        enable = true;
        withNodeJs = true;
        extraPackages = TSdeps ++ lsp ++ packages;
    };

    xdg.configFile.nvim = {
        recursive = true;
        source = symlink "${home}/.dotfiles/home/programs/neovim/config";
    };
}
