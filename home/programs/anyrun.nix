{config, pkgs, ...}:
{
    programs.anyrun = {
        enable = true;
        config = {
            x = { fraction = 0.5; };
            y = { fraction = 0.3; };
            width = { fraction = 0.3; };
            hideIcons = false;
            ignoreExclusiveZones = false;
            layer = "overlay";
            hidePluginInfo = false;
            closeOnClick = false;
            showResultsImmediately = false;
            maxEntries = null;

            plugins = [
                "${pkgs.anyrun}/lib/libapplications.so"
                "${pkgs.anyrun}/lib/libsymbols.so"
            ];
        };

    # Inline comments are supported for language injection into
    # multi-line strings with Treesitter! (Depends on your editor)
        extraCss = /*css */ ''
            .some_class {
                background: red;
            }
        '';

        extraConfigFiles."some-plugin.ron".text = ''
             Config(
              // Position/size fields use an enum for the value, it can be either:
              // Absolute(n): The absolute value in pixels
              // Fraction(n): A fraction of the width or height of the full screen (depends on exclusive zones and the settings related to them) window respectively
              
              // The horizontal position, adjusted so that Relative(0.5) always centers the runner
              x: Fraction(0.5),

              // The vertical position, works the same as `x`
              y: Absolute(0),

              // The width of the runner
              width: Absolute(800),

              // The minimum height of the runner, the runner will expand to fit all the entries
              height: Absolute(0),
              
              // Hide match and plugin info icons  
              hide_icons: false, 

              // ignore exclusive zones, f.e. Waybar  
              ignore_exclusive_zones: false, 

              // Layer shell layer: Background, Bottom, Top, Overlay  
              layer: Overlay, 
              
              // Hide the plugin info panel
              hide_plugin_info: false, 

              // Close window when a click outside the main box is received
              close_on_click: false,

              // Show search results immediately when Anyrun starts
              show_results_immediately: false,

              // Limit amount of entries shown in total
              max_entries: None,
              
              // List of plugins to be loaded by default, can be specified with a relative path to be loaded from the
              // `<anyrun config dir>/plugins` directory or with an absolute path to just load the file the path points to.
              plugins: [
                "libapplications.so",
                "libsymbols.so",
                "libshell.so",
                "libtranslate.so",
              ],
            )               // refer to docs of xdg.configFile for available options
        '';
    };
}
