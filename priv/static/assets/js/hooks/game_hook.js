export default {
  mounted() {
    // Listen for keydown on the element
    this.el.addEventListener("keydown", (e) => {
      if (e.code === "ArrowLeft" || e.code === "ArrowRight") {
        this.pushEvent("key", { code: e.code });
      }
    });

    // Ensure the element can receive focus so it gets key events
    this.el.setAttribute("tabindex", 0);
    this.el.focus();

    // Handle server tick events to move piece down automatically
    this.handleEvent("tick", () => {
      // Simulate a downward arrow press each tick
      this.pushEvent("key", { code: "ArrowDown" });
    });
  },
};
