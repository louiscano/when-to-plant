import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  connect() {
  }

  submit(e) {
    const form = this.element;
    const formData = new FormData(form);

    const params = new URLSearchParams(formData);
    const newUrl = `${form.action}?${params.toString()}`;

    Turbo.visit(newUrl, { frame: "plants" });
    history.pushState({}, "", newUrl);
  }

  resetForm() {
    // const form = this.element;
    // const url = `/plants`;
    // // window.location.reload()
    // console.log(newUrl)
    // Turbo.visit(newUrl, { frame: "plants" });
    // history.pushState({}, "", newUrl);
  }
}
