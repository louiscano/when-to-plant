// app/javascript/controllers/delete_alert_controller.js
import { Controller } from "@hotwired/stimulus";
import Swal from 'sweetalert2';

export default class extends Controller {
  static values = {
    icon: String,
    title: String,
    html: String,
    confirmButtonText: String,
    cancelButtonText: String
  }

  confirmDelete(event) {
    event.preventDefault(); // Prevent the default link action

    Swal.fire({
      icon: this.iconValue || "warning",
      title: this.titleValue || "Êtes vous sur ?",
      html: this.htmlValue || "Supprimer.",
      showCancelButton: true,
      confirmButtonText: this.confirmButtonTextValue || "Oui",
      cancelButtonText: this.cancelButtonTextValue || "Non",
      confirmButtonColor: "#0c4b36"
    }).then((result) => {
      if (result.isConfirmed) {
        // Create a form to submit the delete request
        const form = document.createElement('form');
        form.method = 'post';
        form.action = this.element.href;

        // Add the method and CSRF token
        const methodField = document.createElement('input');
        methodField.type = 'hidden';
        methodField.name = '_method';
        methodField.value = 'delete';
        form.appendChild(methodField);

        const csrfField = document.createElement('input');
        csrfField.type = 'hidden';
        csrfField.name = document.querySelector('meta[name="csrf-param"]').content;
        csrfField.value = document.querySelector('meta[name="csrf-token"]').content;
        form.appendChild(csrfField);

        document.body.appendChild(form);
        form.submit();
      }
    });
  }
}
