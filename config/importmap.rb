# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true
pin "sweetalert2", to: "https://ga.jspm.io/npm:sweetalert2@11.7.2/dist/sweetalert2.all.js"
pin "@stimulus-components/reveal", to: "@stimulus-components--reveal.js" # @5.0.0
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "trix", to: "https://ga.jspm.io/npm:trix@2.0.10/dist/trix.esm.min.js"
