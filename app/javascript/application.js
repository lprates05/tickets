// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails


import jquery from "jquery";
window.jQuery = jquery;
window.$ = jquery;

import { Turbo } from "@hotwired/turbo-rails"
import "@hotwired/turbo-rails"
import "controllers"


Turbo.session.drive = false

import "controllers"

document.addEventListener("DOMContentLoaded", function () {
  const startDateInput = document.getElementById("start_date");
  const endDateInput = document.getElementById("end_date");

  if (startDateInput && endDateInput) {
    startDateInput.addEventListener("change", function () {
      endDateInput.value = startDateInput.value;
    });
  }
});

// Source: https://cdn.jsdelivr.net/npm/@rails/ujs@7.1.0/lib/assets/compiled/rails-ujs.js
// Paste the full contents here:
(function() {
  // full UJS code can be long — easier way:
  const script = document.createElement("script");
  script.src = "https://cdn.jsdelivr.net/npm/@rails/ujs@7.1.0/lib/assets/compiled/rails-ujs.js";
  script.onload = function() {
    Rails.start();
  };
  document.head.appendChild(script);
})();
