import { App } from "astal/gtk4"
import style from "./style.scss"
import { Bar } from "./widget/bar/main"
import { execAsync, GLib, monitorFile, writeFileAsync } from "astal"
import Applauncher from "./widget/applauncher/applauncher"
import { NotificationPopup } from "./widget/notification/notifPopups"
import { windowAnimation } from "./util/hyprland"
import { Menu } from "./widget/menu/main"
import { monitorWallpaper } from "./util/theme"
import { exec } from "astal/process"

const scss = "./style/style.scss"
const css = "/tmp/gtkstyle.css"

execAsync(`sass ${scss} ${css}`)

App.start({
    iconTheme: "Papirus",
    css: style,
    main() {
        execAsync(`sass ${scss} ${css}`)
        App.apply_css(css)
        App.get_monitors().map(Bar)
        App.get_monitors().map(Applauncher)
        App.get_monitors().map(NotificationPopup)
        App.get_monitors().map(Menu)

        windowAnimation()
        monitorFile("./style/", () => {
            exec(`sass ${scss} ${css}`)
            App.reset_css()
            App.apply_css(css)
        })

        print(GLib.get_current_dir())
        
        monitorWallpaper()
    },
})
