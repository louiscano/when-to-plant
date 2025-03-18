import { Controller } from "@hotwired/stimulus";
import Swal from 'sweetalert2';

export default class extends Controller {
  static values = {
    icon: String,
    title: String,
    confirmButtonText: String
  }

  initSweetalert(event) {
    event.preventDefault(); // Prevent the form from being submitted

    Swal.fire({
      icon: this.iconValue,
      title: this.titleValue,
      html: this.htmlValue,
      confirmButtonColor: "#0c4b36",
      showConfirmButton: true,
      showCancelButton: false, // Assuming you don't need a cancel button for login
      animation: true
    }).then((result) => {
      if (result.isConfirmed) {
        // Submit the form manually
        this.element.submit();
      }
    });
  }
}
