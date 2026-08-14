/* Peak Systems — small progressive-enhancement script.
   Its only job is the mobile navigation menu. The site works without it;
   this just makes the "Menu" button open and close the links on phones,
   accessibly (keyboard + screen-reader friendly). */

(function () {
  "use strict";

  var toggle = document.querySelector(".nav-toggle");
  var menu = document.getElementById("primary-nav");
  if (!toggle || !menu) return;

  function isOpen() {
    return toggle.getAttribute("aria-expanded") === "true";
  }

  function setOpen(open) {
    toggle.setAttribute("aria-expanded", String(open));
    menu.classList.toggle("is-open", open);
    toggle.querySelector(".label").textContent = open ? "Close" : "Menu";
  }

  toggle.addEventListener("click", function () {
    setOpen(!isOpen());
  });

  // Close the menu when a link is chosen.
  menu.addEventListener("click", function (e) {
    if (e.target.closest("a")) setOpen(false);
  });

  // Close on Escape and return focus to the button.
  document.addEventListener("keydown", function (e) {
    if (e.key === "Escape" && isOpen()) {
      setOpen(false);
      toggle.focus();
    }
  });

  // If the window is widened past the mobile breakpoint, reset to closed
  // so the desktop layout is never left in the "open" state.
  var mq = window.matchMedia("(min-width: 841px)");
  (mq.addEventListener ? mq.addEventListener.bind(mq, "change") : mq.addListener.bind(mq))(function () {
    if (mq.matches) setOpen(false);
  });
})();
