// For Phoenix.HTML support, including form and button helpers
// copy the following scripts into your javascript bundle:
// * deps/phoenix_html/priv/static/phoenix_html.js

// For Phoenix.Channels support, copy the following scripts
// into your javascript bundle:
// * deps/phoenix/priv/static/phoenix.js

// For Phoenix.LiveView support, copy the following scripts
// into your javascript bundle:
// * deps/phoenix_live_view/priv/static/phoenix_live_view.js

// Handle flash close
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"

const Hooks = {}
import GameHook from "./hooks/game_hook.js"
Hooks.GameHook = GameHook

let liveSocket = new LiveSocket("/live", Socket, { hooks: Hooks })
liveSocket.connect()

// (you can safely remove this if you don't use the default flash component)
document.querySelectorAll("[role=alert][data-flash]").forEach((el) => {
  el.addEventListener("click", () => {
    el.setAttribute("hidden", "");
  });
});
