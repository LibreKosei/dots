{...}:
{
    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        font = {
            name = "monospace";
            size = 15;
        };
        enableGitIntegration = true;
        settings = {
            window_padding_width = 20;
            placement_strategy = "center";
            allow_remote_control = true;

            ###
            # Colors
            ###
            foreground = "#DADADA";
            background = "#141B1E";
            selection_foreground = "#DADADA";
            selection_background = "#2D3437";

            cursor = "#2D3437";
            cursor_text_color = "#DADADA";

            color0 = "#232A2D";
            color1 = "#E57474";
            color2 = "#8CCF7E";
            color3 = "#E5C76B";
            color4 = "#67B0E8";
            color5 = "#C47FD5";
            color6 = "#6CBFBF";
            color7 = "#B3B9B8";

            # Bright colors
            color8 = "#2D3437";
            color9 = "#EF7E7E";
            color10 = "#96D988";
            color11 = "#F4D67A";
            color12 = "#71BAF2";
            color13 = "#CE89DF";
            color14 = "#67CBE7";
            color15 = "#BCD3C2";

            # Tab colors 
            active_tab_background = "#1B2224";
            active_tab_foreground = "#E182E0";
            inactive_tab_foreground = "#CD69CC";
            inactive_tab_background = "#232A2C";
        };
    };
}
