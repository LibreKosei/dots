{config, pkgs, ...}:
    let
        symlink = config.lib.file.mkOutOfStoreSymlink;
        home = config.home.homeDirectory;

        TSdeps = with pkgs; [
            gcc
            nodejs
            vimPlugins.nvim-treesitter.withAllGrammars
        ];

        lsp = with pkgs; [
            lua-language-server
            nixd
            typescript-language-server
            vscode-langservers-extracted
            pyright
            elixir-ls
            lemminx
            neocmakelsp
        ];

        packages = with pkgs; [
            deno
            qt6.qtdeclarative
        ];    
    in
{
    programs.neovim = {
        enable = true;
        withNodeJs = true;
        withRuby = true;
        withPython3 = true;
        extraPackages = TSdeps ++ lsp ++ packages;
        sideloadInitLua = true;
    };

    xdg.configFile.nvim = {
        recursive = true;
        source = symlink "${home}/.dotfiles/users/kosei/neovim/config";
    };
}
