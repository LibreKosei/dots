{config, pkgs, ...}:
    let
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
        ];    
    in
{
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
