{config, options, pkgs, ...}:
{
    services.pipewire = {
        audio.enable = true;
        enable = true;
        pulse.enable = true;
        alsa = {
            enable = true;
            support32Bit = true;
        };
        wireplumber = {
            enable = true;
            extraConfig = {
                "log-level-debug" = {
                    "context.properties" = {
                     # Output Debug log messages as opposed to only the default level (Notice)
                    "log.level" = "D";
                    };
                };
                "wh-ch720n-ldac-hq" = {
                    "monitor.bluez.rules" = [
                        {
                            matches = [
                                {
                                    # Match any bluetooth device with ids equal to that of a WH-1000XM3
                                    "device.name" = "~bluez_card.*";
                                    "device.product.id" = "0x0cd3";
                                    "device.vendor.id" = "usb:054c";
                                }
                            ];
                            actions = {
                                update-props = {
                                    # Set quality to high quality instead of the default of auto
                                "bluez5.a2dp.ldac.quality" = "hq";
                                };
                            };
                        }
                    ];
                };
            };
        };
    };
}
