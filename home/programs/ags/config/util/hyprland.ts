import { App } from "astal/gtk4";
import AstalHyprland from "gi://AstalHyprland?version=0.1";

const hyprland = AstalHyprland.get_default();

export const sendBatch = (batch: string[]) => {
  const cmd = batch
    .filter((x) => !!x)
    .map((x) => `keyword ${x}`)
    .join("; ");

  hyprland.message(`[[BATCH]]/${cmd}`);
};

export function windowAnimation() {
  sendBatch(
    App.get_windows()
      .filter(({ animation }: any) => !!animation)
      .map(
        ({ animation, namespace }: any) =>
          `layerrule animation ${animation == "slide top" ? `slide top` : animation}, ${namespace}`,
      ),
  );
}
