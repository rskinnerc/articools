# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "rxjs", to: "https://ga.jspm.io/npm:rxjs@7.5.7/dist/esm5/index.js"
pin "tslib", to: "https://ga.jspm.io/npm:tslib@2.4.1/tslib.es6.js"
pin "uuid", to: "https://ga.jspm.io/npm:uuid@9.0.0/dist/esm-browser/index.js"
