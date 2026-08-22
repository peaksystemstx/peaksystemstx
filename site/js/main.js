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
  // so the desktop layout is never left in the "open" state. This must match
  // the max-width: 900px breakpoint in styles.css — when it didn't, the menu
  // refused to stay open between 841px and 900px.
  var mq = window.matchMedia("(min-width: 901px)");
  (mq.addEventListener ? mq.addEventListener.bind(mq, "change") : mq.addListener.bind(mq))(function () {
    if (mq.matches) setOpen(false);
  });
})();

/* Gallery lightbox — click a thumbnail to see the photo full size.
   Uses the native <dialog>, so Escape-to-close and the backdrop come free. */
(function () {
  "use strict";

  var dialog = document.getElementById("lightbox");
  var gallery = document.querySelector(".gallery");
  if (!dialog || !gallery || !dialog.showModal) return;

  var img = dialog.querySelector("img");
  var cap = dialog.querySelector(".cap");

  gallery.addEventListener("click", function (e) {
    var shot = e.target.closest(".shot");
    if (!shot) return;
    e.preventDefault();  // without JS the link just opens the image file
    var thumb = shot.querySelector("img");
    img.src = thumb.src;
    img.alt = thumb.alt;
    cap.textContent = shot.querySelector(".cap").textContent;
    dialog.showModal();
  });

  dialog.addEventListener("click", function (e) {
    // Close on the X, or on a click outside the photo itself.
    if (e.target.closest(".lightbox-close") || !e.target.closest("img")) dialog.close();
  });
})();
