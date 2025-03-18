// app/javascript/packs/application.js (ou app/assets/javascripts/application.js si vous n'utilisez pas Webpacker)

// Stimulus
import { Application } from "@hotwired/stimulus"
const application = Application.start()
application.debug = false
window.Stimulus = application
export { application }

// Turbo
import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true

document.addEventListener("turbo:before-fetch-request", function(event) {
  const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  event.detail.fetchOptions.headers['X-CSRF-Token'] = token;
});
