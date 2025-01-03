import { App } from "astal/gtk3";
import style from "./style/bar.scss";
import Bar from "./widget/Bar";

App.start({
  // trick
  css:
    `
        @define-color bg_transp alpha(@window_bg_color, 0.3);
    ` + style,
  instanceName: "bar",
  requestHandler(request, res) {
    print(request);
    res("ok");
  },
  main: () => App.get_monitors().map(Bar),
});
